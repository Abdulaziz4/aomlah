import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:supabase/supabase.dart';

abstract class AbstractSupabase {
  final logger = getLogger("SupabaseService");

  late SupabaseClient supabase;

  Future<PostgrestResponse> upsert(
    AomlahTable table,
    Map<String, dynamic> payload,
  ) async {
    return supabase
        .from(table.name)
        .upsert(payload, returning: ReturningOption.minimal)
        .execute();
  }

  Future<PostgrestResponse> delete(
    AomlahTable table,
    Map<String, dynamic> query,
  ) async {
    final builder = supabase.from(table.name).delete(
          returning: ReturningOption.minimal,
        );
    query.forEach((key, value) {
      builder.eq(key, value);
    });

    return builder.execute();
  }

  Future<List<T>> get<T>(
    AomlahTable table,
    T Function(Map<String, dynamic> json) fromJson, {
    Map<String, dynamic>? query,
    int? limit,
  }) async {
    logger.i("GET ${table.name} | query= $query, limit=$limit");

    final response = await selectEq(
      supabase.from(table.name),
      query: query,
    ).execute();

    if (response.error != null) {
      throw Exception("حدث خطأ ما، الرجاء المحاولة لاحقاً");
    }

    try {
      return _jsonListToObjectList(response.data, fromJson);
    } catch (e) {
      logger.e("An error occur while getting ${table.name} with message $e");
    }
    return [];
  }

  PostgrestFilterBuilder selectEq(
    SupabaseQueryBuilder table, {
    Map<String, dynamic>? query,
    int? limit,
  }) {
    PostgrestFilterBuilder selectBuilder = table.select();
    if (query == null) return selectBuilder;
    query.forEach((key, value) {
      selectBuilder = selectBuilder.eq(key, value);
    });
    if (limit != null) {
      selectBuilder.limit(limit);
    }
    return selectBuilder;
  }

  Future<List<T>> callFn<T>(
    String functionName,
    T Function(Map<String, dynamic> json) fromJson, {
    Map<String, dynamic>? params,
  }) async {
    logger.i("Call Function $functionName | params= $params");

    var result = await supabase
        .rpc(
          functionName,
          params: params,
        )
        .select()
        .execute();

    if (result.error != null) {
      throw Exception("حدث خطأ ما، الرجاء المحاولة لاحقاً");
    }

    try {
      return _jsonListToObjectList(result.data, fromJson);
    } catch (error) {
      logger
          .e("An error occur while getting $functionName with message $error");
    }
    return [];
  }

  List<T> _jsonListToObjectList<T>(
    List<dynamic>? jsonList,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    List<T> res = [];

    jsonList!.forEach((json) {
      try {
        res.add(fromJson(json));
      } catch (e) {
        logger.e("Error while creating $T with message $e");
      }
    });
    return res;
  }
}

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

  Future<PostgrestResponse> update(
    AomlahTable table,
    Map<String, dynamic> payload,
    Map<String, dynamic> match,
  ) async {
    return supabase
        .from(table.name)
        .update(payload, returning: ReturningOption.minimal)
        .match(match)
        .execute();
  }

  Future<PostgrestResponse> insert(
    AomlahTable table,
    Map<String, dynamic> payload,
  ) async {
    return supabase
        .from(table.name)
        .insert(payload, returning: ReturningOption.minimal)
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
    String? select,
    int? limit,
  }) async {
    logger.i("GET ${table.name} | query= $query, limit=$limit");

    final response = await selectEq(
      supabase.from(table.name),
      query: query,
      select: select,
    ).execute();

    print(response.data);

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
    String? select,
    int? limit,
  }) {
    PostgrestFilterBuilder selectBuilder =
        select == null ? table.select() : table.select(select);
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

  Stream<List<T>> subscribeForChanges<T>({
    required AomlahTable table,
    required T Function(Map<String, dynamic> json) fromJson,
    required String primaryKey,
    Map<String, String>? query,
  }) {
    //{table}:{col}=eq.{val} - where {col} is the column name, and {val} is
    //the value which you want to match.
    String match = table.name;
    if (query != null) {
      query.forEach((key, value) {
        match += ":$key=$value";
      });
    }
    return supabase
        .from(match)
        .stream([primaryKey])
        .execute()
        .map<List<T>>((mapsList) {
          return mapsList.map((map) => fromJson(map)).toList();
        });
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

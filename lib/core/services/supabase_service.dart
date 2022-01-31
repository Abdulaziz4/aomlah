import 'package:aomlah/core/services/abstract_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends AbstractSupabase {
  // Returns an initilized SupabaseService instance to be used by locator
  static Future<SupabaseService> getInstance() async {
    final service = SupabaseService();
    await service.initlizeSupabase();
    return service;
  }

  Future<void> initlizeSupabase() async {
    await Supabase.initialize(
      url: 'https://mpkaipwsgfzlxhpcuvrn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MTE2MjYwNywiZXhwIjoxOTU2NzM4NjA3fQ.Q8xH88Z122zm93dKqDifCHfwJTG69t7X2dDsKxplgkg',
      debug: true,
    );
    supabase = Supabase.instance.client;
  }
}

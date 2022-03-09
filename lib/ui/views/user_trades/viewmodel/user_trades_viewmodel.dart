import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';

class UserTradesViewModel extends StreamViewModel<List<Trade>> {
  UserTradesViewModel() {
    setBusy(true);
  }
  final _logger = getLogger("UserTradesViewModel");

  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();

  List<Trade> trades = [];

  List<Trade> get buyTrades =>
      trades.where((trade) => trade.offer!.isBuyTrader).toList();
  List<Trade> get sellTrades =>
      trades.where((trade) => !trade.offer!.isBuyTrader).toList();

  @override
  void onData(List<Trade>? data) {
    _logger.i("onData");
    super.onData(data);
    setBusy(false);
    if (data != null) {
      trades = data;
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("Error occured with meessage $error");
  }

  @override
  Stream<List<Trade>> get stream =>
      _supabaseService.getUserTradesStream(_userService.user.profileId);
}

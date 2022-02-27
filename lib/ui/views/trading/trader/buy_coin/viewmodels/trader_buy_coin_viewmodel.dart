import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:stacked/stacked.dart';

class TraderBuyCoinViewModel extends StreamViewModel<Trade> {
  final _logger = getLogger("TraderBuyCoinViewModel");

  late Trade trade;
  TraderBuyCoinViewModel(this.trade);
  final _supabaseService = locator<SupabaseService>();

  Future<void> changeState(TradeStatus state) async {
    // Setting false inside onData
    setBusy(true);
    await _supabaseService.changeTradeStatus(trade.tradeId, state);
  }

  @override
  void onData(Trade? data) {
    super.onData(data);
    _logger.i("onData");
    setBusy(false);
    if (data != null) {
      trade = data;
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.i("An error occured with message $error");
  }

  @override
  Stream<Trade> get stream => _supabaseService.getTradeStream(trade.tradeId);
}
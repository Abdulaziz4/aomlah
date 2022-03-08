import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TradingViewmodel extends StreamViewModel<Trade> {
  final _logger = getLogger("MerchantSellCoinViewModel");

  final _navService = locator<NavigationService>();

  late Trade trade;
  TradingViewmodel(this.trade);
  final _supabaseService = locator<SupabaseService>();
  final _tradingService = locator<TradingService>();

  Future<void> changeState(TradeStatus state) async {
    // Setting false inside onData
    setBusy(true);
    await _tradingService.updateTradeStatus(trade: trade, newStatus: state);
  }

  Future<void> tryOpenDispute() async {
    final reason = await _navService.navigateTo(Routes.createDisputeView);

    if (reason != null) {
      changeState(TradeStatus.disputed);
    }
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

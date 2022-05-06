import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/enums/trade_status.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/ui/views/trading/viewmodels/trading_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  group('TradingViewModel tests | changeState |', () {
    setUp(() {
      registerFallbackValue(FakeTrade());
      registerServices();
    });

    tearDown(() => unregisterService());

    test(
      "should call updateTradeStatus with the correct status",
      () async {
        const status = TradeStatus.awaiting_payment;
        final Trade trade = Trade(
          tradeId: "",
          amount: 0,
          status: status,
          traderId: "",
          offerId: "",
          price: 0,
        );

        removeRegistrationIfExists<TradingService>();

        final trading = MockTradingService();
        when(
          () => trading.updateTradeStatus(
            trade: any(named: "trade"),
            newStatus: status,
          ),
        ).thenAnswer((_) => Future.value());
        locator.registerSingleton<TradingService>(trading);

        final viewmodel = TradingViewmodel(trade);
        await viewmodel.changeState(status);

        verify(
          () => trading.updateTradeStatus(
            trade: any(named: "trade"),
            newStatus: status,
          ),
        );
      },
    );
  });
}

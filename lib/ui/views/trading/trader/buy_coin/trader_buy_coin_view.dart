import 'dart:async' show Timer;

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/components/bottom_actions.dart';
import 'package:aomlah/ui/views/trading/components/trade_extra_info.dart';
import 'package:aomlah/ui/views/trading/components/trade_receipt.dart';
import 'package:aomlah/ui/views/trading/components/trade_state_header.dart';
import 'package:aomlah/ui/views/trading/trader/buy_coin/viewmodels/trader_buy_coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TraderBuyCoinView extends StatefulWidget {
  final Trade trade;
  const TraderBuyCoinView({
    Key? key,
    required this.trade,
  }) : super(key: key);

  @override
  State<TraderBuyCoinView> createState() => _TraderBuyCoinViewState();
}

class _TraderBuyCoinViewState extends State<TraderBuyCoinView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  final Map<TradeStatus, HeaderStyle> headerStates = {
    TradeStatus.awaiting_payment: HeaderStyle(
      "تم إنشاء الطلب",
      Text("يرجى الدفع للبائع خلال 30:00"),
      Constants.black2dp,
    ),
    TradeStatus.payment_sent: HeaderStyle(
      "في إنتظار تاكيد البائع",
      Text("سيتم تحويل الكمية لمحفظتك تلقائيا بعد تأكيد البائع"),
      Constants.darkBlue,
    ),
    TradeStatus.completed: HeaderStyle(
      "تم إكمال الطلب",
      Text("لقد قمت بعملية الشراء بنجاح"),
      Constants.primaryColor,
    ),
    TradeStatus.canceled: HeaderStyle(
      "تم إلغاء الطلب ",
      SizedBox(),
      Constants.redColor,
    ),
    TradeStatus.disputed: HeaderStyle(
      "متنازع عليه",
      SizedBox(),
      Color.fromARGB(255, 213, 200, 86),
    ),
    //TODO:Add other states
  };

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TraderBuyCoinViewModel>.reactive(
      viewModelBuilder: () => TraderBuyCoinViewModel(widget.trade),
      builder: (context, viewmodel, _) => BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Scaffold(
          key: UniqueKey(),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    verticalDirection: VerticalDirection.up,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TradeExtraInfo(
                        terms: viewmodel.trade.offer?.terms ?? "",
                        bankAccounts: viewmodel.trade.offer?.bankAccounts ?? [],
                      ),
                      buildRecipte(viewmodel.trade),
                      buildHeader(
                        viewmodel.trade.status,
                      ),
                    ],
                  ),
                ),
              ),
              BottomActions(
                onCancel: () {
                  viewmodel.changeState(TradeStatus.canceled);
                },
                onPaymentSent: () {
                  viewmodel.changeState(TradeStatus.payment_sent);
                },
                onPaymentReceived: () {
                  viewmodel.changeState(TradeStatus.completed);
                },
                onOpenDispute: () {
                  viewmodel.changeState(TradeStatus.disputed);
                },
                showCancelButton:
                    viewmodel.trade.status == TradeStatus.awaiting_payment,
                showPaymentSent:
                    viewmodel.trade.status == TradeStatus.awaiting_payment,
                showOpenDispute:
                    viewmodel.trade.status == TradeStatus.payment_sent ||
                        viewmodel.trade.status == TradeStatus.completed,
                showCompleteTrade:
                    viewmodel.trade.status == TradeStatus.payment_sent,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecipte(Trade trade) {
    final fiatQuantity = (trade.amount * trade.price * 3.75);
    return TradeReceipt(
      isBuy: trade.offer!.isBuyTrader,
      quantity: fiatQuantity.toStringAsFixed(2),
      price: "${trade.price * 3.75}",
      cryptoAmount: trade.amount.toString(),
    );
  }

  Widget buildHeader(TradeStatus state) {
    return TradeStateHeader(
      title: headerStates[state]!.title,
      color: headerStates[state]!.color,
      subWidget: headerStates[state]!.subTitle,
    );
  }
}

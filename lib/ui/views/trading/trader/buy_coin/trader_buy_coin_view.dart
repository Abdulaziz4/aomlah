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
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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
  Duration remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (widget.trade.status == TradeStatus.awaiting_payment) {
      final timeout = widget.trade.createdAt!.add(
        Duration(
          minutes: 31,
        ),
      );
      remainingTime = timeout.difference(DateTime.now());
    }

    // if (widget.trade.status == TradeStatus.awaiting_payment) {
    //   // Duration remaining = DateTime.now();
    //   // _timer = Timer(remainingMinutes, () {});
    // final timeout = widget.trade.createdAt!.add(
    //   Duration(
    //     minutes: 31,
    //   ),
    // );
    //   final remainingTime = timeout.difference(DateTime.now());
    //   _timer = Timer.periodic(remainingTime, (timer) {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    final Map<TradeStatus, HeaderStyle> headerStates = {
      TradeStatus.awaiting_payment: HeaderStyle(
        "تم إنشاء الطلب",
        Row(
          children: [
            Text("يرجى الدفع للبائع خلال "),
            buildTimer(),
          ],
        ),
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
                        headerStates,
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

  Widget buildHeader(
    TradeStatus state,
    Map<TradeStatus, HeaderStyle> headerStates,
  ) {
    return TradeStateHeader(
      title: headerStates[state]!.title,
      color: headerStates[state]!.color,
      subWidget: headerStates[state]!.subTitle,
    );
  }

  Widget buildTimer() {
    print(remainingTime);
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: CircularCountDownTimer(
        duration: remainingTime.inSeconds,
        initialDuration: 0,
        width: 44,
        height: 44,
        controller: CountDownController(),
        ringColor: Colors.grey[300]!,
        fillColor: Constants.darkBlue,
        fillGradient: null,
        backgroundGradient: null,
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
          fontSize: 13.0,
          color: Constants.darkBlue,
          fontWeight: FontWeight.bold,
        ),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
      ),
    );
  }
}

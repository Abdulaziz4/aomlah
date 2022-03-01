import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/ui/views/trading/components/bottom_actions.dart';
import 'package:aomlah/ui/views/trading/components/circular_timer.dart';
import 'package:aomlah/ui/views/trading/components/trade_extra_info.dart';
import 'package:aomlah/ui/views/trading/components/trade_receipt.dart';
import 'package:aomlah/ui/views/trading/components/trade_state_header.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/viewmodels/trader_sell_coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TraderSellCoinView extends StatefulWidget {
  final Trade trade;
  const TraderSellCoinView({
    Key? key,
    required this.trade,
  }) : super(key: key);

  @override
  State<TraderSellCoinView> createState() => _TraderSellCoinViewState();
}

class _TraderSellCoinViewState extends State<TraderSellCoinView> {
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
  }

  @override
  Widget build(BuildContext context) {
    final Map<TradeStatus, HeaderStyle> headerStates = {
      TradeStatus.awaiting_payment: HeaderStyle(
        "في إنتظار دفع المشتري",
        Row(
          children: [
            Text("ستصلك الحوالة خلال "),
            buildTimer(),
          ],
        ),
        Constants.black2dp,
      ),
      TradeStatus.payment_sent: HeaderStyle(
        "تم تأكيد الحالولة من المشتري",
        Text(
            "الرجاء التأكد من وصول المبلغ المطلوب لحسابك البنكي ثم النقر على زر التأكيد"),
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
    return ViewModelBuilder<TraderSellCoinViewModel>.reactive(
        viewModelBuilder: () => TraderSellCoinViewModel(widget.trade),
        builder: (context, viewmodel, _) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TradeExtraInfo(
                          terms: viewmodel.trade.offer!.terms,
                        ),
                        buildRecipte(viewmodel.trade),
                        buildHeader(viewmodel.trade.status, headerStates),
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
                      viewmodel.trade.status == TradeStatus.payment_sent,
                  showCompleteTrade:
                      viewmodel.trade.status == TradeStatus.payment_sent,
                )
              ],
            ),
          );
        });
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
    return CircularTimer(endTime: remainingTime);
  }
}

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/ui/views/trading/components/bottom_actions.dart';
import 'package:aomlah/ui/views/trading/components/trade_extra_info.dart';
import 'package:aomlah/ui/views/trading/components/trade_receipt.dart';
import 'package:aomlah/ui/views/trading/components/trade_state_header.dart';
import 'package:flutter/material.dart';

class TraderSellCoinView extends StatefulWidget {
  const TraderSellCoinView({Key? key}) : super(key: key);

  @override
  State<TraderSellCoinView> createState() => _TraderSellCoinViewState();
}

class _TraderSellCoinViewState extends State<TraderSellCoinView> {
  final Map<TradeState, HeaderStyle> headerStates = {
    TradeState.awaiting_payment: HeaderStyle(
      "في إنتظار دفع المشتري",
      Text("ستصلك الحوالة خلال 30:00"),
      Constants.black2dp,
    ),
    TradeState.payment_sent: HeaderStyle(
      "تم تأكيد الحالولة من المشتري",
      Text(
          "الرجاء التأكد من وصول المبلغ المطلوب لحسابك البنكي ثم النقر على زر التأكيد"),
      Constants.darkBlue,
    ),
    TradeState.completed: HeaderStyle(
      "تم إكمال الطلب",
      Text("لقد قمت بعملية الشراء بنجاح"),
      Constants.primaryColor,
    ),
    TradeState.canceled: HeaderStyle(
      "تم إلغاء الطلب ",
      SizedBox(),
      Constants.redColor,
    ),
    TradeState.disputed: HeaderStyle(
      "متنازع عليه",
      SizedBox(),
      Color.fromARGB(255, 213, 200, 86),
    ),
    //TODO:Add other states
  };
  TradeState currentState = TradeState.awaiting_payment;

  List<TradeState> states = [
    TradeState.awaiting_payment,
    TradeState.payment_sent,
    TradeState.completed,
  ];

  @override
  Widget build(BuildContext context) {
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
                    terms: "نتسير",
                    bankAccounts: [],
                  ),
                  buildRecipte(),
                  buildHeader(),
                ],
              ),
            ),
          ),
          BottomActions(
            onCancel: () {
              changeState(TradeState.canceled);
            },
            onPaymentSent: () {
              changeState(TradeState.payment_sent);
            },
            onPaymentReceived: () {
              changeState(TradeState.completed);
            },
            onOpenDispute: () {
              changeState(TradeState.disputed);
            },
            showCancelButton: currentState == TradeState.awaiting_payment,
            showPaymentSent: currentState == TradeState.awaiting_payment,
            showOpenDispute: currentState == TradeState.payment_sent,
            showCompleteTrade: currentState == TradeState.payment_sent,
          )
        ],
      ),
    );
  }

  Widget buildRecipte() {
    return TradeReceipt(
      isBuy: false,
      quantity: "3020",
      price: "144,644,244",
      cryptoAmount: "0.52234",
    );
  }

  Widget buildHeader() {
    return TradeStateHeader(
      title: headerStates[currentState]!.title,
      color: headerStates[currentState]!.color,
      subWidget: headerStates[currentState]!.subTitle,
    );
  }

  void changeState(TradeState state) {
    setState(() {
      currentState = state;
    });
  }
}

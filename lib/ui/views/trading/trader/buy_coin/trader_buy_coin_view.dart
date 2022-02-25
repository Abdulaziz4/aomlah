import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/ui/views/trading/components/bottom_actions.dart';
import 'package:aomlah/ui/views/trading/components/trade_extra_info.dart';
import 'package:aomlah/ui/views/trading/components/trade_receipt.dart';
import 'package:aomlah/ui/views/trading/components/trade_state_header.dart';
import 'package:flutter/material.dart';

class TraderBuyCoinView extends StatefulWidget {
  const TraderBuyCoinView({Key? key}) : super(key: key);

  @override
  State<TraderBuyCoinView> createState() => _TraderBuyCoinViewState();
}

class _TraderBuyCoinViewState extends State<TraderBuyCoinView> {
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
  TradeStatus currentState = TradeStatus.awaiting_payment;

  List<TradeStatus> states = [
    TradeStatus.awaiting_payment,
    TradeStatus.payment_sent,
    TradeStatus.completed,
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
              changeState(TradeStatus.canceled);
            },
            onPaymentSent: () {
              changeState(TradeStatus.payment_sent);
            },
            onPaymentReceived: () {
              changeState(TradeStatus.completed);
            },
            onOpenDispute: () {
              changeState(TradeStatus.disputed);
            },
            showCancelButton: currentState == TradeStatus.awaiting_payment,
            showPaymentSent: currentState == TradeStatus.awaiting_payment,
            showOpenDispute: currentState == TradeStatus.payment_sent ||
                currentState == TradeStatus.completed,
            showCompleteTrade: currentState == TradeStatus.payment_sent,
          )
        ],
      ),
    );
  }

  Widget buildRecipte() {
    return TradeReceipt(
      isBuy: true,
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

  void changeState(TradeStatus state) {
    setState(() {
      currentState = state;
    });
  }
}

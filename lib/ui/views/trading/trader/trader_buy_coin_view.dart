import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/ui/shared/button_tile.dart';
import 'package:aomlah/ui/shared/expandable_card.dart';
import 'package:aomlah/ui/views/trading/components/bottom_actions.dart';
import 'package:aomlah/ui/views/trading/components/receipt_info.dart';
import 'package:aomlah/ui/views/trading/components/trade_state_header.dart';
import 'package:flutter/material.dart';

class TraderBuyCoinView extends StatefulWidget {
  const TraderBuyCoinView({Key? key}) : super(key: key);

  @override
  State<TraderBuyCoinView> createState() => _TraderBuyCoinViewState();
}

class _TraderBuyCoinViewState extends State<TraderBuyCoinView> {
  final Map<TradeState, HeaderStyle> headerStates = {
    TradeState.awaiting_payment: HeaderStyle(
      "تم إنشاء الطلب",
      Text("يرجى الدفع للبائع خلال 30:00"),
      Constants.black2dp,
    ),
    TradeState.payment_sent: HeaderStyle(
      "في إنتظار تاكيد البائع",
      Text("سيتم تحويل الكمية لمحفظتك تلقائيا بعد تأكيد البائع"),
      Constants.lighBlue,
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
                  ExpandableCard(
                    title: "الشروط والاحكام",
                    expandedSection: Text("ماقبل اس تي سي باي"),
                    color: Constants.black2dp,
                  ),
                  ExpandableCard(
                    title: "الحسابات البنكية",
                    expandedSection: Text("اثممخ"),
                    color: Constants.black2dp,
                  ),
                  ButtonTile(
                    onPressed: () {},
                    text: "المحادثة",
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
            showOpenDispute: currentState == TradeState.payment_sent ||
                currentState == TradeState.completed,
            showCompleteTrade: currentState == TradeState.payment_sent,
          )
        ],
      ),
    );
  }

  Container buildRecipte() {
    return Container(
      color: Constants.black2dp,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "شراء",
                    style: Constants.largeText.copyWith(
                      color: Constants.primaryColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("BTC", style: Constants.largeText),
                ],
              ),
              RecipteInfo(
                rightText: "المبلغ الاجمالي",
                leftText: "3000 ر.س",
              ),
              RecipteInfo(
                rightText: "السعر",
                leftText: "144,644,244 ر.س",
              ),
              RecipteInfo(
                rightText: "كمية العملة الرقمية",
                leftText: "0.533443 BTC",
              ),
            ],
          ),
        ],
      ),
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

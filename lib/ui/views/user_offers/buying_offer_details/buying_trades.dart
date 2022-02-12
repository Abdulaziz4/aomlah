import 'package:flutter/material.dart';
import '../components/user_trading_card.dart';

class UserBuyingTrades extends StatefulWidget {
  const UserBuyingTrades({Key? key}) : super(key: key);

  @override
  _UserBuyingTradesState createState() => _UserBuyingTradesState();
}

class _UserBuyingTradesState extends State<UserBuyingTrades> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: const [
              UserTradingCard(
                isBuy: true,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

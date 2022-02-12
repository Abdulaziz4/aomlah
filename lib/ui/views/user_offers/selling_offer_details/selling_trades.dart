import 'package:flutter/material.dart';
import '../components/user_trading_card.dart';

class UserSellingTrades extends StatefulWidget {
  const UserSellingTrades({Key? key}) : super(key: key);

  @override
  _UserSellingTradesState createState() => _UserSellingTradesState();
}

class _UserSellingTradesState extends State<UserSellingTrades> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              UserTradingCard(
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
                stat: 'بانتظار الدفع',
              ),
              UserTradingCard(
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
            ],
          ),
        ),
      ],
    );
  }
}

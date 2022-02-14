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
    return SingleChildScrollView(
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
    );
  }
}

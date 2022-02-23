import 'package:aomlah/ui/views/user_offer_details/components/user_trade_card.dart';
import 'package:flutter/material.dart';

class UserOfferTrades extends StatefulWidget {
  const UserOfferTrades({Key? key}) : super(key: key);

  @override
  _UserOfferTradesState createState() => _UserOfferTradesState();
}

class _UserOfferTradesState extends State<UserOfferTrades> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          UserTradeCard(
            stat: 'بانتظار الدفع',
          ),
          UserTradeCard(
            stat: 'بانتظار الدفع',
          ),
          UserTradeCard(
            stat: 'بانتظار الدفع',
          ),
          UserTradeCard(
            stat: 'بانتظار الدفع',
          ),
          UserTradeCard(
            stat: 'بانتظار الدفع',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<Map<String, dynamic>>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(wallet.toString()),
      ),
    );
  }
}

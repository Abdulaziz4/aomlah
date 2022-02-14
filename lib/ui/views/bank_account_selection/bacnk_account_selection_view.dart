import 'package:flutter/material.dart';

class BankAccountSelectionView extends StatelessWidget {
  const BankAccountSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اختيار حساب بنكي"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text("Accounts"),
            ],
          ),
        ),
      ),
    );
  }
}

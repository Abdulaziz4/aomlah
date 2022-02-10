import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/faucets/faucets_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FaucetsView extends StatelessWidget {
  const FaucetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacucetsViewmodel>.nonReactive(
        viewModelBuilder: () => FacucetsViewmodel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("💰💰💰"),
            ),
            body: Center(
              child: Column(
                children: [
                  Text(
                    "PLEASE DON'T FUND YOUR WALLET UNLESS YOU NEED IT!",
                    style: Constants.mediumText,
                  ),
                  CustomButton(
                    onPressed: () {
                      viewmodel.fund();
                    },
                    text: "Fund Me",
                  ),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/faucets/faucets_viewmodel.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PLEASE DON'T FUND YOUR WALLET UNLESS YOU NEED IT!",
                    textAlign: TextAlign.center,
                    style: Constants.mediumText,
                  ),
                  Text(
                    "Transactions takes up to 30 sec to arrive",
                    textAlign: TextAlign.center,
                    style: Constants.smallText,
                  ),
                  CustomButton(
                    onPressed: () {
                      viewmodel.fund();
                    },
                    text: "Fund Me",
                  ),
                  CustomButton(
                    onPressed: () {
                      viewmodel.fundEth();
                    },
                    text: "Fund Me Eth",
                  ),
                ],
              ),
            ),
          );
        });
  }
}

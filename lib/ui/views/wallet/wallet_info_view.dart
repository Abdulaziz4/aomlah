import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/models/real_time_wallet.dart';

class WalletInfoView extends StatefulWidget {
  const WalletInfoView({Key? key}) : super(key: key);

  @override
  State<WalletInfoView> createState() => _WalletInfoViewState();
}

class _WalletInfoViewState extends State<WalletInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black3dp,
        title: Text('محفظتك',
            style: TextStyle(
                color: Constants.darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: WalletInfoViewBody(),
    );
  }
}

class WalletInfoViewBody extends StatefulWidget {
  const WalletInfoViewBody({Key? key}) : super(key: key);

  @override
  State<WalletInfoViewBody> createState() => _WalletInfoViewBodyState();
}

class _WalletInfoViewBodyState extends State<WalletInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<RealTimeWallet>(context);
    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 210,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Constants.black2dp,
                        boxShadow: Constants.shadow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'القيمة الكلية',
                            style: TextStyle(color: Constants.darkBlue),
                          ),
                          // Text('PLACEHOLDER'),
                          Text("Satoshi Balance: " + wallet.balance.toString()),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'عنوان المحفظة',
                            style: TextStyle(color: Constants.darkBlue),
                          ),
                          Text(wallet.address),
                          RoundedButton(text: 'تحويل', press: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'سجل المعاملات',
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          );
        });
  }
}

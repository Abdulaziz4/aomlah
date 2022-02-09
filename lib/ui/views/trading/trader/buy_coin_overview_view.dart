import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/trader/viewmodels/buy_coin_overview_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/trading/components/spanned_text_item.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class BuyCoinOverviewView extends StatefulWidget {
  const BuyCoinOverviewView({Key? key}) : super(key: key);

  @override
  State<BuyCoinOverviewView> createState() => _BuyCoinOverviewViewState();
}

class _BuyCoinOverviewViewState extends State<BuyCoinOverviewView> {
  TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyCoinOverviewViewmodel>.reactive(
        viewModelBuilder: () => BuyCoinOverviewViewmodel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(
                title: Text("شراء BTC"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpannedTextItem(
                        rightText: "السعر",
                        leftText: "144.134.13 ر.س",
                      ),
                      SpannedTextItem(
                        rightText: "الكمية",
                        leftText: "0.04151 BTC",
                      ),
                      SpannedTextItem(
                        rightText: "الحد الادنى",
                        leftText: "200 ر.س",
                      ),
                      buildPurchaseWindow(
                        key: viewmodel.formKey,
                        onSave: viewmodel.setAmount,
                      ),
                      Row(
                        children: [
                          Text(
                            "تفاصيل التداول",
                            style: Constants.largeText.copyWith(
                              color: Constants.darkBlue,
                            ),
                          ),
                        ],
                      ),
                      buildSellerInfo(),
                      SizedBox(height: 10),
                      buildBankAccounts(),
                      SizedBox(height: 10),
                      buildTermsAndConsitions(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Column buildTermsAndConsitions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشروط والاحكام",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "ما أقبل اس تي سي باي",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildSellerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "البائع",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "عبدالعزيز القحطني",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildBankAccounts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الحسابات البنكية",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          spacing: 20.0,
          children: const [
            BankAccountItem(bankName: "بنك الرياض"),
            BankAccountItem(bankName: "بنك الراجحي"),
          ],
        ),
      ],
    );
  }

  Widget buildPurchaseWindow(
      {required GlobalKey<FormState> key,
      required void Function(String) onSave}) {
    return Form(
      key: key,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Constants.black2dp,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          children: [
            RoundedInputField(
              label: "المبلغ",
              hintText: "ادخل المبلغ",
              fillColor: Constants.black4dp,
              validator: (val) {
                // TODO: Check min limit and balance for sell
                if (val == null) {
                  return "الرجاء إدخال المبلغ";
                }
                return null;
              },
              onSave: (val) {
                if (val != null) {
                  onSave(val);
                }
              },
              controller: amountController,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ر.س",
                    style: Constants.smallText,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ستحصل على",
                  style: Constants.smallText.copyWith(color: Colors.grey),
                ),
                Text(
                  amountToBtc().toStringAsFixed(8) + " BTC",
                  style: Constants.smallText,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                onPressed: () {},
                text: "شراء BTC",
                width: double.infinity,
                height: 43,
              ),
            )
          ],
        ),
      ),
    );
  }

  double amountToBtc() {
    return amountController.text.isEmpty
        ? 0
        : Provider.of<Bitcoin>(context).amountToBtc(
            double.parse(amountController.text),
          );
  }
}

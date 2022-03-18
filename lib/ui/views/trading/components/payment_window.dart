import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentWindow extends StatefulWidget {
  final Offer offer;
  final GlobalKey<FormState> formKey;
  final void Function(String) onAmountSaved;
  final void Function() onSubmit;
  final void Function()? onSelectBankAccount;
  final BankAccount? selectedBank;
  final String? errorMessage;
  const PaymentWindow({
    Key? key,
    required this.offer,
    required this.formKey,
    required this.onAmountSaved,
    required this.onSubmit,
    this.onSelectBankAccount,
    this.errorMessage,
    this.selectedBank,
  }) : super(key: key);

  @override
  State<PaymentWindow> createState() => _PaymentWindowState();
}

class _PaymentWindowState extends State<PaymentWindow> {
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<BtcRealTimeWallet>(context);
    final btc = Provider.of<Bitcoin>(context);
    return Form(
      key: widget.formKey,
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
                if (val == null || val.isEmpty) {
                  return "الرجاء إدخال المبلغ";
                }

                final amount = double.tryParse(val);

                if (amount == null || amount <= 0) {
                  return "الرجاء إدخال مبلغ صحيح";
                }
                if (amount < widget.offer.minTrade) {
                  return "ادخل مبلغ اعلى من الحد الادنى";
                }
                final btcAmount = btc.amountToBtc(amount);

                if (!widget.offer.isBuyTrader &&
                    btcAmount > wallet.balanceBTC) {
                  return "ادخل مبلغ ضمن رصيد محفظتك";
                }

                return null;
              },
              onSave: (val) {
                if (val != null) {
                  widget.onAmountSaved(val);
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
            if (!widget.offer.isBuyTrader)
              GestureDetector(
                onTap: widget.onSelectBankAccount,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الحساب البنكي",
                        style: Constants.smallText,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Constants.black4dp,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.selectedBank != null
                                  ? widget.selectedBank!.bankName
                                  : "اختر حساب بنكي",
                              style: Constants.smallText.copyWith(
                                color: widget.selectedBank != null
                                    ? Colors.white
                                    : Colors.grey[400],
                              ),
                            ),
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (!widget.offer.isBuyTrader)
              Row(
                children: [
                  Text(
                    "رصيد محفظتك " + wallet.balanceBTC.toString() + " BTC",
                    style: Constants.verySmallText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' ≈ ',
                    style: Constants.verySmallText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    wallet.balanceSR(btc.price).toString(),
                    style: Constants.verySmallText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' ر.س',
                    style: Constants.verySmallText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.offer.isBuyTrader
                      ? "ستحصل على"
                      : "كمية العملة الرقمية",
                  style: Constants.smallText.copyWith(color: Colors.grey),
                ),
                Text(
                  amountToBtc().toStringAsFixed(8) + " BTC",
                  style: Constants.smallText,
                ),
              ],
            ),
            if (widget.errorMessage != null)
              Text(
                widget.errorMessage!,
                style:
                    Constants.verySmallText.copyWith(color: Constants.redColor),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                onPressed: widget.onSubmit,
                text: widget.offer.isBuyTrader ? "شراء BTC" : "بيع BTC",
                width: double.infinity,
                height: 43,
                color: widget.offer.isBuyTrader
                    ? Constants.primaryColor
                    : Constants.redColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  double amountToBtc() {
    final amount = double.tryParse(amountController.text);
    return amount == null
        ? 0
        : Provider.of<Bitcoin>(context).amountToBtc(
            double.parse(amountController.text),
          );
  }
}

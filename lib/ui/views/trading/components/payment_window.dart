import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentWindow extends StatefulWidget {
  final bool isBuy;
  final GlobalKey<FormState> formKey;
  final void Function(String) onAmountSaved;
  final void Function() onSubmit;
  final void Function()? onSelectBankAccount;

  const PaymentWindow({
    Key? key,
    required this.isBuy,
    required this.formKey,
    required this.onAmountSaved,
    required this.onSubmit,
    this.onSelectBankAccount,
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
                // TODO: Check min limit and balance for sell

                if (val == null || val.isEmpty) {
                  return "الرجاء إدخال المبلغ";
                }
                final amount = double.parse(val) * 1.0;
                if (amount <= 0) {
                  return "الرحاء إدخال مبلغ صحيح";
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
            if (!widget.isBuy)
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
                              "اختر حساب بنكي",
                              style: Constants.smallText.copyWith(
                                color: Colors.grey[400],
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
                onPressed: widget.onSubmit,
                text: widget.isBuy ? "شراء BTC" : "بيع BTC",
                width: double.infinity,
                height: 43,
                color:
                    widget.isBuy ? Constants.primaryColor : Constants.redColor,
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

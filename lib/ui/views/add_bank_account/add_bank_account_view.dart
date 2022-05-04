import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/add_bank_account/viewmodels/add_bank_account_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddBankAccountView extends StatefulWidget {
  const AddBankAccountView({Key? key}) : super(key: key);

  @override
  State<AddBankAccountView> createState() => _AddBankAccountViewState();
}

class _AddBankAccountViewState extends State<AddBankAccountView> {
  final bankList = [
    'بنك الاهلي',
    'بنك الراجحي',
    'بنك ساب',
    'بنك الرياض',
    'بنك الإنماء',
    'بنك البلاد',
    'البنك السعودي للإستثمار'
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddBankAccountViewmodel>.reactive(
        viewModelBuilder: () => AddBankAccountViewmodel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(
                title: Text("إضافة حساب بنكي"),
              ),
              body: Form(
                key: viewmodel.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildLabel(),
                      buildDropdownWrapper(
                        viewmodel.bankAccount,
                        viewmodel.setBank,
                      ),
                      RoundedInputField(
                        label: "الاسم",
                        hintText: "ادخل اسم صاحب الحساب",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال الاسم";
                          }
                          return null;
                        },
                        onSave: viewmodel.setName,
                      ),
                      RoundedInputField(
                        label: "الايبان",
                        hintText: "ادخل رقم الايبان",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال الايبان";
                          } else if (value.length < 22) {
                            return "الرجاء إدخال ايبان يحتوي على اكثر من ٢٢ رقم";
                          }
                          return null;
                        },
                        onSave: viewmodel.setIban,
                        suffix: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SA",
                              style: Constants.smallText,
                            ),
                          ],
                        ),
                      ),
                      Container(height: 100),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: viewmodel.trySubmit,
                          child: Text("إضافة الحساب"),
                          style:
                              ElevatedButton.styleFrom(onPrimary: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  DropdownButton bankAccDropButton(
    String? currentVal,
    void Function(String?) setValue,
  ) =>
      DropdownButton<String>(
        isExpanded: true,
        items: bankList.map(buildBankItems).toList(),
        hint: Text("اختر بنك"),
        onChanged: setValue,
        value: currentVal,
      );

  DropdownMenuItem<String> buildBankItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(),
        ),
      );

  Widget buildDropdownWrapper(
    String? currentVal,
    void Function(String?) setValue,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.black3dp,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Constants.black5dp,
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: bankAccDropButton(currentVal, setValue),
          ),
        ),
      ),
    );
  }

  Widget buildLabel() {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Text(
        "البنك",
        style: Constants.smallText.copyWith(
          color: Color(0xFFE2E2E2),
        ),
      ),
    );
  }
}

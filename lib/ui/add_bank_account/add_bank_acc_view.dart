import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/bank_account_selection/Custom_Menu_V2.dart';
import 'package:aomlah/ui/views/create_offer/common/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddBankAccView extends StatefulWidget {
  const AddBankAccView({Key? key}) : super(key: key);

  @override
  State<AddBankAccView> createState() => _addBankAccState();
}

class _addBankAccState extends State<AddBankAccView> {
  final bankList = [
    'بنك الاهلي',
    'بنك الراجحي',
    'بنك ساب',
    'بنك الرياض',
    'بنك الإنماء',
    'بنك البلاد',
    'البنك السعودي للإستثمار'
  ];
  String? cListVal, currListVal;
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    return Scaffold(
        appBar: AppBar(
          title: Text("إضافة حساب بنكي"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
              child: Text("البنك"),
            ),
            CustomMenuV2(
              dropdownButton: bankAccDropButton(),
              menuMargin: EdgeInsets.all(0),
            ),
            RoundedInputField(
              label: "الاسم",
              hintText: "ادخل اسم صاحب الحساب",
            ),
            RoundedInputField(
              label: "الايبان",
              hintText: "ادخل رقم الايبان",
            ),
            Container(height: 100),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("إضافة الحساب"),
                  style: ElevatedButton.styleFrom(onPrimary: Colors.white)),
            ),
          ],
        ));
  }

  DropdownButton bankAccDropButton() => DropdownButton(
        isExpanded: true,
        items: bankList.map(buildBankItems).toList(),
        onChanged: (value) => setState(() => this.cListVal = value as String?),
        value: cListVal,
      );

  DropdownMenuItem<String> buildBankItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            //fontWeight: FontWeight.bold,
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class addBankAcc extends StatefulWidget {
  const addBankAcc({Key? key}) : super(key: key);

  @override
  State<addBankAcc> createState() => _addBankAccState();
}

class _addBankAccState extends State<addBankAcc> {
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    return Scaffold(
        appBar: AppBar(
          title: Text("إضافة حساب بنكي"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 20),
            MyStatefulWidget(),
            Container(height: 10),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 10, 10),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
              decoration: BoxDecoration(
                  color: Color(0xff3D4955),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                focusNode: myFocusNode,
                decoration: InputDecoration(
                 // labelStyle: TextStyle(
                     // color:
                        //  myFocusNode.hasFocus ? Colors.white : Colors.grey),
                  border: InputBorder.none,
                  labelText: "الاسم",
                  hintText: "ادخل اسم صاحب الحساب",
                ),
              ),
            ),
            Container(height: 10),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 10, 10),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
              decoration: BoxDecoration(
                  color: Color(0xff3D4955),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                  //labelStyle: TextStyle(
                     // color:
                         // myFocusNode.hasFocus ? Colors.white : Colors.grey),
                  border: InputBorder.none,
                  labelText: "الايبان",
                  hintText: "ادخل رقم الايبان",
                ),
              ),
            ),
            Container(height: 250),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("إضافة الحساب"),
                  style: ElevatedButton.styleFrom(onPrimary: Colors.white)),
            ),
          ],
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'بنك الاهلي';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 10, 10),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
      decoration: BoxDecoration(
          color: Color(0xff3D4955), borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          labelText: "البنك",
          
        ),
        //underline: SizedBox(),
        value: dropdownValue,
        icon: SvgPicture.asset('assets/icons/DownArrow.svg'),
        elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),

        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'بنك الاهلي',
          'بنك الراجحي',
          'بنك ساب',
          'بنك الرياض',
          'بنك الإنماء',
          'بنك البلاد',
          'البنك السعودي للإستثمار'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

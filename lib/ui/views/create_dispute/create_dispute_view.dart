import 'package:flutter/material.dart';
import '../../../core/app/utils/constants.dart';
import '../../shared/custom_button.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class CreateDisputeView extends StatefulWidget {
  const CreateDisputeView({Key? key}) : super(key: key);

  @override
  _CreateDisputeViewState createState() => _CreateDisputeViewState();
}

class _CreateDisputeViewState extends State<CreateDisputeView> {
  final formKey = GlobalKey<FormState>();
  bool isAgreed1 = true;
  bool isAgreed2 = false;
  bool isAgreed3 = false;
  bool isAgreed4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black3dp,
        title: Text(
          'رفع طلب النزاع',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF263441),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(15, 30, 44, 0.8299999833106995),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomButton(
                  onPressed: () async {
                    if (await confirm(context)) {
                      return print('pressedOK');
                    }
                    return print('pressedCancel');
                  },

                  text: 'إكمال طلب النزاع',
                  color: Color(0xFFCF5050),
                  // height: 37,
                  // width: 200,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  text: 'إلغاء',
                  color: Constants.black4dp,
                  // height: 37,
                  // width: 114,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الأسباب:',
              style: Constants.mediumText.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 20,
                  height: 20,
                  color: Constants.black5dp,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Constants.black5dp,
                    ),
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Constants.lighBlue,
                      value: isAgreed1,
                      onChanged: (value) {
                        setState(() {
                          isAgreed1 = value!;
                          isAgreed2 = false;
                          isAgreed3 = false;
                          isAgreed4 = false;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  'لا أريد إكمال العملية',
                  style: Constants.smallText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 20,
                  height: 20,
                  color: Constants.black5dp,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Constants.black5dp,
                    ),
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Constants.lighBlue,
                      value: isAgreed2,
                      onChanged: (value) {
                        setState(() {
                          isAgreed1 = false;
                          isAgreed2 = true;
                          isAgreed3 = false;
                          isAgreed4 = false;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  'لم نتفق على المبلغ',
                  style: Constants.smallText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 20,
                  height: 20,
                  color: Constants.black5dp,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Constants.black5dp,
                    ),
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Constants.lighBlue,
                      value: isAgreed3,
                      onChanged: (value) {
                        setState(() {
                          isAgreed1 = false;
                          isAgreed2 = false;
                          isAgreed3 = true;
                          isAgreed4 = false;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  'حصلت على اتفاق أفضل',
                  style: Constants.smallText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 20,
                  height: 20,
                  color: Constants.black5dp,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Constants.black5dp,
                    ),
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Constants.lighBlue,
                      value: isAgreed4,
                      onChanged: (value) {
                        setState(() {
                          isAgreed1 = false;
                          isAgreed2 = false;
                          isAgreed3 = false;
                          isAgreed4 = true;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  'أخرى:',
                  style: Constants.smallText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (isAgreed4)
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: 312,
                height: 102,
                decoration: BoxDecoration(
                  color: Color(0xFF0F1E2C),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: 'ادخل السبب هنا',
                          hintStyle: Constants.smallText,
                          border: InputBorder.none),
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "يجب ادخال سبب";
                        }
                        return null;
                      }),
                ),
              ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
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

  final _navService = locator<NavigationService>();

  int selectedIndex = 0;

  List<String> options = [
    "لا أريد إكمال العملية",
    "أخذ وقت أطول من المتوقع",
    "عدم الجدية",
    "أخرى",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    if (await confirm(context)) {}
                    print('pressedCancel');
                  },
                  text: 'إكمال طلب النزاع',
                  color: Color(0xFFCF5050),
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
            ...List.generate(options.length, ((index) {
              return buildCheckbox(index);
            })),
            if (selectedIndex == options.length - 1)
              Form(
                key: formKey,
                child: RoundedInputField(
                  label: "",
                  hintText: "ادخل السبب هنا",
                  maxLines: 3,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckbox(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
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
                value: selectedIndex == index,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
          Text(
            options[index],
            style: Constants.smallText.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void confirmDispute() {}
}

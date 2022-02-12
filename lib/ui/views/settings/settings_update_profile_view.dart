import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../core/app/utils/constants.dart';
import '../create_offer/common/custom_card_title.dart';
import '../create_offer/common/custom_input_field.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black3dp,
        title: Text('تحديث الملف الشخصي',
            style: TextStyle(
                color: Constants.darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: UpdateProfileViewBody(),
    );
  }
}

class UpdateProfileViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CusCardTitle(title: 'الاسم'),
            CustomInputField(
              hintText: 'ادخل الاسم',
              validator: (value) {
                if (value == null || value.isEmpty) return 'الرجاء إدخال الاسم';
              },

            ),
            RoundedButton(text: "تحديث", press: (){
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState?.save();
            })
          ],
        ),
      ),
    );
  }
}


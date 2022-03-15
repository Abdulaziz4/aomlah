import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:aomlah/ui/views/settings/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';
import '../../shared/custom_card_title.dart';
import '../../shared/custom_input_field.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
  String? name;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, viewmodel, _) {
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
                      if (value == null || value.isEmpty)
                        return 'الرجاء إدخال الاسم';
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  RoundedButton(
                      text: "تحديث",
                      press: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState?.save();
                        viewmodel.updateUserName(name!);
                      })
                ],
              ),
            ),
          );
        });
  }
}

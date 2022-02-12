import 'package:aomlah/ui/shared/button_tile.dart';
import 'package:aomlah/ui/views/settings/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';

class SettingsHome extends StatefulWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  State<SettingsHome> createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black3dp,
        title: Text('الإعدادات',
            style: TextStyle(
            color: Constants.darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SettingsHomeBody(),
    );
  }
}
class SettingsHomeBody extends StatefulWidget {
   SettingsHomeBody({Key? key}) : super(key: key);

  @override
  State<SettingsHomeBody> createState() => _SettingsHomeBodyState();
}

class _SettingsHomeBodyState extends State<SettingsHomeBody> {
  bool switchState=true;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
    builder: (context, viewmodel, _) {
    return Column(
      children: [

        ButtonTile(onPressed: (){print('fffff'); }, text: 'حالتك متوفر',
          widget: Switch.adaptive(
              onChanged: (value)=> setState((){switchState=value;}),
              value: switchState),
        ),
        ButtonTile(onPressed: (){viewmodel.updateProfileNav();}, text: 'تحديث الملف الشخصي'),
        ButtonTile(onPressed: (){viewmodel.logout();}, text: 'تسجيل الخروج',color: Colors.red,),

      ],

    );
  });
  }
}



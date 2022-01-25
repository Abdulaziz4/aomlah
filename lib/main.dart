import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/custom_theme.dart';
import 'package:aomlah/ui/shared/arabic_material_app.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArabicMaterialApp(
      theme: CustomTheme.mainTheme,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

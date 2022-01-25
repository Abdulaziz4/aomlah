import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:stacked_services/stacked_services.dart';

class ArabicMaterialApp extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final ThemeData? theme;

  const ArabicMaterialApp({
    Key? key,
    this.navigatorKey,
    this.onGenerateRoute,
    this.theme,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //unfocus input field upon click outside its boundries
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('ar', ''),
        ],
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (BuildContext context, Widget? child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ),
                  child: child!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

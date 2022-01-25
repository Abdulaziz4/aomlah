import 'package:aomlah/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
        viewModelBuilder: () => StartupViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            body: Center(
              child: Text(
                "Aomlah",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        });
  }
}

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/prediction/viewmodels/prediction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PredictionView extends StatelessWidget {
  const PredictionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PredictionViewModel>.reactive(
      viewModelBuilder: () => PredictionViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, viewmodel, _) => BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/prediction-bg.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: viewmodel.isBusy
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: Column(
                      children: [
                        Text(
                          "سعر اغلاق اليوم المتوقع لعملة",
                          style: Constants.largeText,
                        ),
                        Text(
                          "BTC",
                          style: Constants.veryLargeText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\$${viewmodel.predictionModel.prediction}",
                          style: Constants.veryLargeText.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

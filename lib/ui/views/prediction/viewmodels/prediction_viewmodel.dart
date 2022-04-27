import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/prediction.dart';
import 'package:aomlah/core/services/prediction_service.dart';
import 'package:stacked/stacked.dart';

class PredictionViewModel extends BaseViewModel {
  final _predictionService = locator<PredictionService>();

  late Prediction predictionModel;

  Future<void> init() async {
    setBusy(true);
    predictionModel = await _predictionService.getPrediction();
    setBusy(false);
  }
}

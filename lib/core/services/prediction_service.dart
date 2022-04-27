import 'dart:convert';

import 'package:aomlah/core/models/prediction.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PredictionService {
  final String apiUrl = dotenv.env['PREDICTION_API_URL'] ?? "";

  Future<Prediction> getPrediction() async {
    final response = await http.get(Uri.parse(apiUrl + "/predict"));

    final decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return Prediction.fromJson(decodedResponse);
  }
}

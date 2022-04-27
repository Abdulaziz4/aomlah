class Prediction {
  final double prediction;
  final double sentiment;
  final String sentimentClass;
  Prediction({
    required this.prediction,
    required this.sentiment,
    required this.sentimentClass,
  });

  Prediction copyWith({
    double? prediction,
    double? sentiment,
    String? sentimentClass,
  }) {
    return Prediction(
      prediction: prediction ?? this.prediction,
      sentiment: sentiment ?? this.sentiment,
      sentimentClass: sentimentClass ?? this.sentimentClass,
    );
  }

  factory Prediction.fromJson(Map<String, dynamic> map) {
    return Prediction(
      prediction: double.parse(map["prediction"]),
      sentiment: double.parse(map['sentiment']),
      sentimentClass: map['sentimentClass'] ?? '',
    );
  }
}

class ClassifyResponse {
  final String labelName;
  final double confidence;

  ClassifyResponse({required this.labelName, required this.confidence});

  factory ClassifyResponse.fromJson(Map<String, dynamic> json) {
    return ClassifyResponse(
        labelName: json['labelName'], confidence: json['confidence']);
  }
}

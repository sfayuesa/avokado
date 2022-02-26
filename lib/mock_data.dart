import 'dart:convert';

import 'package:flutter/services.dart';

class MockData {
  static final MockData _singleton = MockData._internal();
  factory MockData() {
    return _singleton;
  }
  MockData._internal();

  List<BasicMockData> dashboard = [];

  Future<void> init() async {
    var _mockJson = await rootBundle.loadString("assets/json/mock.json");
    var _decodedJson = json.decode(_mockJson);
    var _listDashboard = _decodedJson["dashboard"] as List;
    for (var e in _listDashboard) {
      dashboard.add(
        BasicMockData(
          title: e["title"],
          imageUri: e["imageUri"],
          description: e["description"],
        ),
      );
    }
    return;
  }
}

class BasicMockData {
  String title;
  String imageUri;
  String? description;

  BasicMockData({
    required this.title,
    required this.imageUri,
    this.description,
  });
}

import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/grills_model.dart';

class GrillsRepository {
  Future<List<GrillsModel>> fetchGrills() async {
    String jsonString = await rootBundle.loadString('jsons/grills.json');
    List list = jsonDecode(jsonString);
    return list.map((json) => GrillsModel.fromMap(json)).toList();
  }
}

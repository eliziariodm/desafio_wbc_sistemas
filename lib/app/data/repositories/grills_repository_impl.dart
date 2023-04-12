import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../models/grills_model.dart';

class GrillsRepositoryImpl {
  // @override
  Future<List<GrillsModel>> fetchGrills() async {
    try {
      String jsonString = await rootBundle.loadString('jsons/grills.json');
      List list = jsonDecode(jsonString);

      return list.map((json) => GrillsModel.fromMap(json)).toList();
    } catch (e) {
      log('Erro Repository Impl $e');
      return throw Exception();
    }
  }
}

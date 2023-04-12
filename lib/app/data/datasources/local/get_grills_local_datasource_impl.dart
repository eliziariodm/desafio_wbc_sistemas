import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/grills_model.dart';
import '../get_grills_datasource.dart';

class GetGrillsLocalDatasourceImpl implements GetGrillsDatasource {
  @override
  Future<List<GrillsModel>> getGrillsDatasource() async {
    String jsonString = await rootBundle.loadString('jsons/grills.json');

    final result = jsonDecode(jsonString) as List;

    if (result.isNotEmpty) {
      final listGrills =
          result.map((grills) => GrillsModel.fromMap(grills)).toList();

      return listGrills;
    } else {
      return throw Exception();
    }
  }
}

import 'package:flutter/material.dart';

import '../data/models/grills_model.dart';
import '../data/repositories/grills_repository.dart';

class GrillsController extends ChangeNotifier {
  final repository = GrillsRepository();

  List<GrillsModel> grillsList = <GrillsModel>[];

  Future<List<GrillsModel>> getGrills() async {
    return grillsList = await repository.fetchGrills();
  }
}

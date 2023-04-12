import 'package:flutter/material.dart';

import '../data/models/grills_model.dart';
import '../data/repositories/get_grills_repository.dart';

class GrillsController extends ChangeNotifier {
  final GetGrillsRepository _repository;

  List<GrillsModel> grillsList = <GrillsModel>[];
  List<GrillsModel> auxiliaryList = <GrillsModel>[];

  GrillsController(this._repository);

  Future<List<GrillsModel>> getGrills(String? value) async {
    auxiliaryList = await _repository.getGrillsRepository();

    if (value != '') {
      grillsList = auxiliaryList
          .where(
            (model) =>
                model.product.toLowerCase().contains(value.toString()) ||
                model.price.contains(value.toString()),
          )
          .toList();
    } else {
      grillsList = auxiliaryList;
    }

    notifyListeners();

    return grillsList;
  }
}

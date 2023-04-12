import 'package:flutter/material.dart';

import '../data/models/grills_model.dart';
import '../data/repositories/grills_repository_impl.dart';

class GrillsController extends ChangeNotifier {
  final repository = GrillsRepositoryImpl();

  List<GrillsModel> grillsList = <GrillsModel>[];
  List<GrillsModel> auxiliaryList = <GrillsModel>[];

  Future<List<GrillsModel>> getGrills(String? value) async {
    auxiliaryList = await repository.fetchGrills();

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

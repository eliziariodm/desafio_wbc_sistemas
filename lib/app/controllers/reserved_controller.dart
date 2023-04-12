import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/models/grills_model.dart';

class ReservedController extends ChangeNotifier {
  List<GrillsModel> reservedList = <GrillsModel>[];

  late Box boxReserved;
  get openBoxReserved => _openBoxReserved;

  _openBoxReserved() async {
    boxReserved = await Hive.openBox<GrillsModel>('reserved');
    await _readyReserved();
  }

  _readyReserved() async {
    for (var grills in boxReserved.keys) {
      GrillsModel grillsModel = await boxReserved.get(grills);
      reservedList.add(grillsModel);
      notifyListeners();
    }
  }

  addReserved(GrillsModel items) async {
    if (!reservedList.any((model) => model.id == items.id)) {
      reservedList.add(items);

      await boxReserved.put(items.id, items);

      notifyListeners();
    }
  }

  removeReserved(GrillsModel items) async {
    reservedList.remove(items);

    await boxReserved.delete(items.id);

    notifyListeners();
  }
}

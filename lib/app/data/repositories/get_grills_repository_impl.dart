import 'dart:developer';

import '../datasources/get_grills_datasource.dart';
import '../models/grills_model.dart';
import 'get_grills_repository.dart';

class GetGrillsRepositoryImpl implements GetGrillsRepository {
  final GetGrillsDatasource _getGrillsDatasource;

  GetGrillsRepositoryImpl(this._getGrillsDatasource);

  @override
  Future<List<GrillsModel>> getGrillsRepository() async {
    try {
      final result = await _getGrillsDatasource.getGrillsDatasource();

      return result;
    } catch (e) {
      log('Repository Impl $e');
      return throw Exception();
    }
  }
}

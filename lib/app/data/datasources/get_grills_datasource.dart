import '../models/grills_model.dart';

abstract class GetGrillsDatasource {
  Future<List<GrillsModel>> getGrillsDatasource();
}

import '../models/grills_model.dart';

abstract class GetGrillsRepository {
  Future<List<GrillsModel>> getGrillsRepository();
}

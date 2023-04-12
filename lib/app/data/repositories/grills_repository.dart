import '../models/grills_model.dart';

abstract class GrillsRepository {
  Future<List<GrillsModel>> fetchGrills();
}

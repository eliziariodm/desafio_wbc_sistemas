import 'package:desafio_wbc_sistemas/app/data/models/grills_model.dart';
import 'package:desafio_wbc_sistemas/app/data/repositories/get_grills_repository.dart';
import 'package:flutter_test/flutter_test.dart';

List<GrillsModel> listGrills = [
  GrillsModel(
    id: 0,
    product: 'Churrasqueira X',
    image: 'image1.png',
    price: '100,00',
  ),
  GrillsModel(
    id: 1,
    product: 'Churrasqueira Y',
    image: 'image2.png',
    price: '200,00',
  ),
];

class GetGrillsRepositoryImpl implements GetGrillsRepository {
  @override
  Future<List<GrillsModel>> getGrillsRepository() async {
    return listGrills;
  }
}

main() {
  GetGrillsRepository repository = GetGrillsRepositoryImpl();

  test("O teste deve retornar uma lista de grills no repository.", () async {
    final result = await repository.getGrillsRepository();

    expect(result, isA<List<GrillsModel>>());
  });
}

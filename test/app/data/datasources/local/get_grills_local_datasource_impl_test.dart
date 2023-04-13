import 'package:desafio_wbc_sistemas/app/data/datasources/get_grills_datasource.dart';
import 'package:desafio_wbc_sistemas/app/data/datasources/local/get_grills_local_datasource_impl.dart';
import 'package:desafio_wbc_sistemas/app/data/models/grills_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetGrillsDatasource datasource = GetGrillsLocalDatasourceImpl();

  test('Deve retornar uma lista de grills no datasource local.', () async {
    final result = await datasource.getGrillsDatasource();

    expect(result, isA<List<GrillsModel>>());
  });
}

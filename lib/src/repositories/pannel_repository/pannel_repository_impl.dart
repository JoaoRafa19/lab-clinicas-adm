import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './pannel_repository.dart';

class PannelRepositoryImpl implements PannelRepository {
  final RestClient restClient;

  PannelRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, String>> callOnPannel(
      String password, int attendantDesk) async {
    try {
      final Response(data: {'id': id}) =
          await restClient.auth.post('/painelCheckin', data: {
        'password': password,
        'time_called': DateTime.now().toIso8601String(),
        'attendant_dest': attendantDesk,
      });
      return Right(id);
    } on DioException catch (e, s) {
      log("Erro ao chamar paciente no painel", error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}

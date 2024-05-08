import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class PannelRepository {
  Future<Either<RepositoryException, String>> callOnPannel(String password, int attendantDesk);
}

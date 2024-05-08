import 'package:asyncstate/asyncstate.dart' as async_state;
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _repository;

  HomeController({required AttendantDeskAssignmentRepository repository})
      : _repository = repository;

  Future<void> startService(int deskNumber) async {
    async_state.AsyncState.show();
    final result = await _repository.startService(deskNumber);
    switch (result) {
      case Left():
        async_state.AsyncState.hide();
        showError('Erro ao iniciar guichê');
      case Right():
        // chamar proximo paciente
        async_state.AsyncState.hide();
        showSucess("Registro com sucesso");
    }
  }
}

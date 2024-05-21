import 'package:asyncstate/asyncstate.dart' as async_state;
import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _repository;
  final CallNextPatientService _callNextPatientService;

  final _informationForm = signal<PatientInformationFormModel?>(null);

  PatientInformationFormModel? get informationForm => _informationForm();

  HomeController({
    required AttendantDeskAssignmentRepository repository,
    required CallNextPatientService callNextPatientService,
  })  : _repository = repository,
        _callNextPatientService = callNextPatientService;

  Future<void> startService(int deskNumber) async {
    async_state.AsyncState.show();
    final result = await _repository.startService(deskNumber);
    switch (result) {
      case Left():
        async_state.AsyncState.hide();
        showError('Erro ao iniciar guichê');
      case Right():
        final result = await _callNextPatientService.execute();
        switch (result) {
          case Left():
            showError("Erro ao chamar o proximo paciente");
          case Right(value: final form?):
            async_state.AsyncState.hide();
            _informationForm.set(form);
          case Right(value: _):
            async_state.AsyncState.hide();
            showInfo('Nenhum paciente aguardando. \n Pode tomar um cafezinho!');
        }
    }
  }
}

import 'dart:developer';

import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/pannel_repository/pannel_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class CallNextPatientService {
  CallNextPatientService({
    required this.patientInformationFormRepository,
    required this.attendantDeskAssignmentRepository,
    required this.pannelRepository,
  });
  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendantDeskAssignmentRepository attendantDeskAssignmentRepository;
  final PannelRepository pannelRepository;

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      execute() async {
    final result = await patientInformationFormRepository.callNextToCheckIn();

    switch (result) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(
      PatientInformationFormModel form) async {
    final resultDest =
        await attendantDeskAssignmentRepository.getDeskAssignment();
    switch (resultDest) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final pannelResult =
            await pannelRepository.callOnPannel(form.password, deskNumber);
        switch (pannelResult) {
          case Left(value: final exception):
            log("ATENÇÂO Não foi possível chamar o paciente",
                error: exception,
                stackTrace: StackTrace.fromString(
                    "ATENÇÂO Não foi possível chamar o paciente"));
            return Right(form);
          case Right():
            return Right(form);
        }
    }
  }
}

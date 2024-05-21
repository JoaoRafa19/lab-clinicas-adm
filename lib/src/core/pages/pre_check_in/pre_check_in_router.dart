import 'package:fe_lab_clinicas_adm/src/core/pages/pre_check_in/pre_check_in_controller.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/pre_check_in/pre_check_in_page.dart';
import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PreCheckInRouter extends FlutterGetItPageRouter {
  const PreCheckInRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PreCheckInController>(
          (i) => PreCheckInController(callNextPatientService: i()),
        )
      ];

  @override
  String get routeName => "/pre-check-in";

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;
        context.get<PreCheckInController>().informationForm.set(form);
        return const PreCheckInPage();
      };
}

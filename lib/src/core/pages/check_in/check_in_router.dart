import 'package:fe_lab_clinicas_adm/src/core/pages/check_in/check_in_controller.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/check_in/check_in_page.dart';
import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class CheckInRouter extends FlutterGetItPageRouter {
  const CheckInRouter({super.key});

  @override
  String get routeName => '/check_in';

  @override
  List<Bind<Object>> get bindings =>
      [Bind.lazySingleton<CheckInController>((i) => CheckInController())];

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;
        context.get<CheckInController>().informationForm.set(form);

        return const CheckInPage();
      };
}

import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_adm/src/bindings/lab_clinicas_adm_applicaiton_binding.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/check_in/check_in_router.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/home/home_router.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/login/login_router.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/pre_check_in/pre_check_in_router.dart';
import 'package:fe_lab_clinicas_adm/src/core/pages/splash/splash_page.dart';
import 'package:fe_lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasAdm());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasAdm extends StatelessWidget {
  const LabClinicasAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas ADM',
      binding: LabClinicasAdmApplicaitonBinding(),
      pageBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [
        LoginRouter(),
        HomeRouter(),
        PreCheckInRouter(),
        CheckInRouter(),
      ],
    );
  }
}

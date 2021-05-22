import 'package:flutter/material.dart';
import 'package:gorapid_application/services/forms_screen.dart';
import 'package:gorapid_application/services/work_expirence.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => FormsScreen(),
      '/work_expirence': (context) => WorkExpirence(),
    },
  ));
}

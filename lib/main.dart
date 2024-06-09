import 'package:design/binding/initial_binding.dart';
import 'package:design/routing/routing.dart';
import 'package:design/view/register.dart';
import 'package:design/view/quiz.dart';
import 'package:design/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/initial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Question App',
      getPages: appRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 213, 194, 15)),
        useMaterial3: true,
      ),
      home: const Initial(),
    );
  }
}

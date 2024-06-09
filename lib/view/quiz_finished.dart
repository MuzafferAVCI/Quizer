import 'dart:async';
import 'package:design/constant/padding_extension.dart';
import 'package:design/controller/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/text_constants.dart';

class QuizFinished extends StatefulWidget {
  const QuizFinished({super.key});

  @override
  State<QuizFinished> createState() => _QuizFinishedState();
}

class _QuizFinishedState extends State<QuizFinished> {
  final SoruController soruController = Get.put(SoruController());
  @override
  void initState() {
    super.initState();
    soruController.submitExam();
    homegit();
  }

  void homegit() {
    Timer(const Duration(milliseconds: 2500), () {
      Get.toNamed('/skorTablosu');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.loginHorAndVerPad, // Burada kendi padding değerlerinizi kullanabilirsiniz
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(height: 20),
              ), // SizedBox ekleyerek metin ile CircularProgressIndicator arasında boşluk ekledim
              Text(
                sinavinizBitti,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

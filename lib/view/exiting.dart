import 'dart:async';
import 'package:design/constant/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/text_constants.dart';

class Exiting extends StatefulWidget {
  const Exiting({super.key});

  @override
  State<Exiting> createState() => _ExitingState();
}

class _ExitingState extends State<Exiting> {
  @override
  void initState() {
    super.initState();
    loginegit();
  }

  void loginegit() {
    Timer(const Duration(milliseconds: 1500), () {
      Get.offAllNamed('/login');
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
              Center(
                child: SizedBox(
                  width: Get.width * 0.25,
                  height: Get.height * 0.1,
                  child: const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // SizedBox ekleyerek metin ile CircularProgressIndicator arasında boşluk ekledim
              Text(
                cikisYapiliyor,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

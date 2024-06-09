import 'dart:async';
import 'package:design/constant/image_constant.dart';
import 'package:design/constant/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  void initState() {
    super.initState();
    loginegit();
  }

  void loginegit() {
    Timer(const Duration(milliseconds: 2200), () {
      Get.toNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: context.loginHorAndVerPad,
          child: Center(
            child: Image.asset(
              quiz,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

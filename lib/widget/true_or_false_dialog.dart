/*
import 'package:design/constant/padding_extension.dart';
import 'package:design/controller/skor_tablosu_controller.dart';
import 'package:design/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*  _controller.reverse().then((_) {
      Navigator.of(context).pop();
    });*/

class TrueOrFalseDialog extends StatefulWidget {
  TrueOrFalseDialog({Key? key}) : super(key: key);

  QuizController quizController = Get.find<QuizController>();

  @override
  _TrueOrFalseDialogState createState() => _TrueOrFalseDialogState();
}

class _TrueOrFalseDialogState extends State<TrueOrFalseDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  QuizController quizController = Get.find<QuizController>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -4),
          end: const Offset(0, -3),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          height: Get.height * .3,
          width: Get.width,
          child: Column(
            children: [
              context.heightBox(.14),
              const Text(
                'INCORRECT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              context.heightBox(.02),
              SizedBox(
                width: Get.width * .8,
                child: const CustomButton(
                    buttonText: 'That was close',
                    buttonColor: Colors.white,
                    textColor: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
*/
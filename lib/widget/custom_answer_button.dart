import 'package:design/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAnswerButton extends StatelessWidget {
  const CustomAnswerButton({
    Key? key,
    required this.text,
    this.topLeft = 20,
    this.topRight = 20,
    this.bottomLeft = 20,
    this.bottomRight = 20,
    required this.onTap,
    required this.buttonColor,
  }) : super(key: key);

  final String text;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final VoidCallback onTap;
  final MaterialColor buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.yellow,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: Get.height * 0.15,
          width: Get.width * 0.38,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
            boxShadow: [
              BoxShadow(
                color: buttonColor.shade900,
                spreadRadius: 1,
                blurRadius: 0,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: CustomText(
              isHeadLine: true,
              isQuestionHeadLine: true,
              text: text,
              textColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

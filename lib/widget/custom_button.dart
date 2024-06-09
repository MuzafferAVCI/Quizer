import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String? imageName;
  final Color buttonColor;
  final Color textColor;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    this.imageName,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageName != null)
              (Image.asset(
                imageName ?? "",
                width: Get.width * 0.1,
              )),
            Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
            ),
          ],
        )),
      ),
    );
  }
}

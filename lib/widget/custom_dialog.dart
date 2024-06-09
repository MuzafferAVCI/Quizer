import 'package:design/constant/color_constants.dart';
import 'package:design/constant/gap_enum.dart';
import 'package:design/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/image_constant.dart';

class CustomDialog extends StatelessWidget {
  final String dialogButtonText;
  final String message;
  final Color dialogButtonColor;
  final Color dialogTextColor;
  final bool isSuccess;
  final bool needButton;
  const CustomDialog({
    super.key,
    required this.dialogButtonText,
    required this.dialogButtonColor,
    required this.dialogTextColor,
    required this.isSuccess,
    required this.message,
    required this.needButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GapEnum.S.heightBox,
            SizedBox(
                width: Get.width * 0.2,
                height: Get.height * 0.1,
                child: isSuccess ? Image.asset(greenCheckMark) : Image.asset(kirmiziCarpi)),
            GapEnum.S.heightBox,
            Text(
              isSuccess ? "Successful :)" : "Unfortunately :(",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            GapEnum.S.heightBox,
            Text(
              message,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
            ),
            GapEnum.N.heightBox,
            needButton
                ? CustomButton(buttonText: dialogButtonText, buttonColor: textFieldFillColor, textColor: Colors.black)
                : const Text(""),
          ],
        ),
      ),
    );
  }
}

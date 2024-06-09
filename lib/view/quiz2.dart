import 'package:design/constant/padding_extension.dart';
import 'package:design/constant/text_constants.dart';
import 'package:design/controller/quiz_controller.dart';
import 'package:design/widget/custom_exit_dialog.dart';
import 'package:design/widget/custom_text.dart';
import 'package:design/widget/true_or_false_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/gap_enum.dart';

class QuizView2 extends GetView<SoruController> {
  const QuizView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    exitDialogGoster() {
      return showDialog(context: context, builder: (BuildContext context) => const CustomExitDialog());
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                exitDialogGoster();
              },
              child: Text(
                "Sınavı bitir",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red.shade700),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: context.loginHorAndVerPad,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  height: Get.height * 0.35,
                  width: Get.width * 0.87,
                  child: CustomText(
                    text: question,
                    isHeadLine: true,
                    isQuestionHeadLine: true,
                  ),
                ),
                GapEnum.xL.heightBox,
                ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ElevatedButton(onPressed: () {}, child: const Text("data"));
                    }),
                // Obx(() {
                //   return controller.isDialogVisible.value ? TrueOrFalseDialog() : const SizedBox.shrink();
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

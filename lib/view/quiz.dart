import 'package:design/constant/padding_extension.dart';
import 'package:design/widget/custom_exit_dialog.dart';
import 'package:design/widget/custom_text.dart';
// import 'package:design/widget/true_or_false_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/gap_enum.dart';
import '../constant/text_constants.dart';
import '../controller/quiz_controller.dart';
// import '../models/soru_model.dart';
import '../widget/custom_answer_button.dart';

class QuizView extends GetView<SoruController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SoruController controller = Get.put(SoruController());

    exitDialogGoster() {
      return showDialog(context: context, builder: (BuildContext context) => const CustomExitDialog());
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                exitDialogGoster();
              },
              child: Text(
                sinaviBitir,
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
                //Soru metni Container:
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 243, 244),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 178, 175, 175),
                        spreadRadius: 1,
                        blurRadius: 0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  height: Get.height * 0.35,
                  width: Get.width * 0.87,
                  child: Obx(() {
                    if (controller.soruModel.isNotEmpty) {
                      return CustomText(
                        text: controller.soruModel[controller.soruIndex.toInt()].soruMetni,
                        isHeadLine: true,
                        isQuestionHeadLine: true,
                      );
                    } else {
                      return CustomText(
                        text: yukleniyor,
                        isHeadLine: true,
                        isQuestionHeadLine: true,
                      );
                    }
                  }),
                ),
                GapEnum.L.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  //Cevaplar Container:
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: Get.height * 0.35,
                    width: Get.width * 0.9,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() {
                                  return CustomAnswerButton(
                                      buttonColor: Colors.red,
                                      //!Burada hata var range error!!
                                      text: controller.soruModel[controller.soruIndex.toInt()].a,
                                      // topRight: 0,
                                      // bottomLeft: 0,
                                      // bottomRight: 0,
                                      onTap: () {
                                        controller.cevabiKaydet(controller.soruIndex.toInt() + 1, "a");
                                        controller.nextQuestion();
                                        // controller.isDialogVisible.value = true;
                                        // Future.delayed(const Duration(milliseconds: 1400), () {
                                        //   controller.isDialogVisible.value = false;
                                        // });
                                      });
                                }),
                                Obx(() {
                                  return CustomAnswerButton(
                                      //!BUrada da hata var gıbı rangeerror
                                      buttonColor: Colors.blue,
                                      text: controller.soruModel[controller.soruIndex.toInt()].b,
                                      // topLeft: 0,
                                      // bottomLeft: 0,
                                      // bottomRight: 0,
                                      onTap: () {
                                        controller.cevabiKaydet(controller.soruIndex.toInt() + 1, "b");
                                        controller.nextQuestion();
                                      });
                                }),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                return CustomAnswerButton(
                                    buttonColor: Colors.orange,
                                    text: controller.soruModel[controller.soruIndex.toInt()].c,
                                    // topRight: 0,
                                    // topLeft: 0,
                                    // bottomRight: 0,
                                    onTap: () {
                                      controller.cevabiKaydet(controller.soruIndex.toInt() + 1, "c");
                                      controller.nextQuestion();
                                    });
                              }),
                              Obx(() {
                                return CustomAnswerButton(
                                    buttonColor: Colors.green,
                                    text: controller.soruModel[controller.soruIndex.toInt()].d,
                                    // topRight: 0,
                                    // topLeft: 0,
                                    // bottomLeft: 0,
                                    onTap: () {
                                      controller.cevabiKaydet(controller.soruIndex.toInt() + 1, "d");
                                      controller.nextQuestion();
                                    });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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

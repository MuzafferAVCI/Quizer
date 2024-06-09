import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../constant/gap_enum.dart';
import '../constant/image_constant.dart';
import '../controller/quiz_controller.dart';
import 'custom_button.dart';

class CustomExitDialog extends StatelessWidget {
  const CustomExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final SoruController soruController = Get.put(SoruController());
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GapEnum.S.heightBox,
          //unlemIsareti
          SizedBox(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  /*     width: Get.width * 0.1,
                  height: Get.height * 0.05,*/
                  child: Image.asset(uyariIsareti),
                ),
              ),
              Expanded(
                flex: 7,
                child: SizedBox(
                  /*width: Get.width * 0.63,
                  height: Get.height * 0.06,*/
                  child: Text(
                    textAlign: TextAlign.center,
                    "Çıkış yapmak istediğinizden emin misiniz?",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
          GapEnum.S.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: SizedBox(
              child: Text(
                textAlign: TextAlign.center,
                "Şimdi çıkarsanız sınavınız sonlanacak ve işaretlemediğiniz sorular puana dahil edilmeyecek",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ),
          GapEnum.M.heightBox,
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.3,
                  height: Get.height * 0.05,
                  child: CustomButton(
                    buttonText: "Evet",
                    buttonColor: Colors.green,
                    textColor: Colors.white,
                    onTap: () {
                      soruController.soruIndex.value = 0;
                      Get.offAndToNamed('/quizFinished');
                    },
                  ),
                ),
                GapEnum.xS.widthBox,
                SizedBox(
                  width: Get.width * 0.3,
                  height: Get.height * 0.05,
                  child: CustomButton(
                    buttonText: "hayır",
                    buttonColor: Colors.red,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

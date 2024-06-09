import 'package:design/constant/padding_extension.dart';
import 'package:design/constant/text_constants.dart';
import 'package:design/controller/login_controller.dart';
import 'package:design/widget/custom_dialog.dart';
import 'package:design/widget/custom_text.dart';
import 'package:design/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../constant/color_constants.dart';
import '../constant/gap_enum.dart';
import '../constant/image_constant.dart';
import '../widget/custom_button.dart';

class SignInView extends GetView<LoginController> {
  SignInView({super.key});
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    //Dialog gösterme metodu
    dialogGoster(bool isSuccess, String message, String buttonText, bool needButton) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          isSuccess: isSuccess,
          dialogButtonText: buttonText,
          dialogButtonColor: Colors.blue,
          dialogTextColor: Colors.black,
          message: message,
          needButton: needButton,
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: context.loginHorAndVerPad,
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                GapEnum.M.heightBox,
                Row(
                  children: [
                    CustomText(isHeadLine: true, isQuestionHeadLine: false, text: helloThere),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(wavingHand),
                    ),
                  ],
                ),
                GapEnum.S.heightBox,
                CustomFormBuilderTF(
                  controller: controller.userNameEC,
                  name: username,
                  isRequired: true,
                  hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                  labelText: userName,
                ),
                GapEnum.S.heightBox,
                Obx(
                  () => CustomFormBuilderTF(
                    controller: controller.passwordEC,
                    name: password,
                    isRequired: true,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    isPassword: true,
                    labelText: password,
                    isObsecureText: controller.obsecureText.value,
                  ),
                ),
                GapEnum.S.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        checkColor: Colors.white,
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value!;
                        },
                      ),
                    ),
                    Text(
                      rememberMe,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                GapEnum.M.heightBox,
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      createanAccount,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: forgotPasswordColor),
                    ),
                  ),
                ),
                GapEnum.xxl.heightBox,
                CustomButton(
                  buttonText: signUp,
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onTap: () async {
                    String cevap = await loginController.validateUser(true);

                    if (cevap == "success") {
                      dialogGoster(true, "Giriş başarılı", "", false);
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        Get.back();
                        controller.clearForm(); //controllerdaki textleri temizledik.
                        Get.toNamed('/home');
                      });
                    } else {
                      print(cevap);
                      dialogGoster(false, "Giriş başarısız", "Try again", true);
                      //!Birden çok kez yanlış girince kırmızı yanıyor formfield'lar
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        controller.clearForm(); //controllerdaki textleri temizledik.
                        Get.back();
                        Get.toNamed('/login');
                      });
                    }

//if (formKey.currentState!.validate())
                    //Onaylanırsa "home" sayfasına yönlendir
                  },
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

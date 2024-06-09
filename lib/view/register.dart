import 'package:design/constant/color_constants.dart';
import 'package:design/constant/gap_enum.dart';
import 'package:design/constant/image_constant.dart';
import 'package:design/constant/padding_extension.dart';
import 'package:design/constant/text_constants.dart';
import 'package:design/controller/login_controller.dart';

import 'package:design/controller/register_controller.dart';
import 'package:design/widget/custom_button.dart';
import 'package:design/widget/custom_text.dart';
import 'package:design/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../widget/custom_dialog.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
    final LoginController loginController = Get.put(LoginController());

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
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: context.loginHorAndVerPad,
              child: FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    CustomText(isHeadLine: true, isQuestionHeadLine: false, text: createanAccount),
                    GapEnum.xS.heightBox,
                    CustomText(text: plsComplrYourPrfl, isHeadLine: false, isQuestionHeadLine: false),
                    GapEnum.N.heightBox,
                    CustomFormBuilderTF(
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      labelText: "Name",
                      controller: controller.nameEC,
                      isRequired: true,
                      name: 'name',
                    ),
                    GapEnum.S.heightBox,
                    CustomFormBuilderTF(
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      labelText: "Surname",
                      controller: controller.surNameEC,
                      isRequired: true,
                      name: 'surName',
                    ),
                    GapEnum.S.heightBox,
                    CustomFormBuilderTF(
                      controller: controller.userNameEC,
                      name: 'username',
                      isRequired: true,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      labelText: "Username",
                    ),
                    GapEnum.S.heightBox,
                    CustomFormBuilderTF(
                      controller: controller.eMailEC,
                      name: 'email',
                      isRequired: true,
                      isEmail: true,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      labelText: "Email",
                    ),
                    GapEnum.S.heightBox,
                    Obx(
                      () => CustomFormBuilderTF(
                        controller: controller.passwordEC,
                        name: 'Password',
                        isRequired: true,
                        hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                        isPassword: true,
                        labelText: "Password",
                        isObsecureText: loginController.obsecureText.value,
                      ),
                    ),
                    GapEnum.S.heightBox,
                    /* Remember me iptal edildi!!!
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
                    ),*/
                    GapEnum.S.heightBox,
                    CustomButton(
                      textColor: Colors.black,
                      buttonColor: textFieldFillColor,
                      imageName: google,
                      buttonText: googleIleGirisyap,
                    ),
                    GapEnum.S.heightBox,
                    CustomButton(
                        buttonText: signUp,
                        buttonColor: Colors.black,
                        textColor: Colors.white,
                        onTap: () async {
                          // Buradaki if bloguna herhangi bir hata oldugunda özel mesajlar yazdıracajk şekilde düzenle !!!!!!

                          String cevap = await registerController.registerUser();

                          if (cevap == "Kullanıcı başarıyla kaydedildi") {
                            //deneme2 == "success"
                            //formKey.currentState!.validate()
                            dialogGoster(true, cevap, "Go home", false);
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              Get.back();
                              Get.toNamed('/home');
                            });
                          } else {
                            dialogGoster(false, cevap, "Try again", true);
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              Get.back();
                              Get.toNamed('/register');
                            });
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
//Şifre en az 8 karakterli falan olmalı diye özellik eklenecek!!!!
//Giriş sayfası backend ile entegre edilecek!!!!!
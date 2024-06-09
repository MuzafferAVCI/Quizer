// ignore_for_file: avoid_print

import 'package:design/widget/custom_button.dart';
import 'package:design/widget/custom_drawer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../constant/gap_enum.dart';
import '../constant/image_constant.dart';
import '../constant/text_constants.dart';
import '../controller/login_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    snack() {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hataOlustu),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text(quizer),
          accountEmail: null,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(quiz),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // const DrawerHeader(
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //   ),
        //   child: CustomDrawerText(
        //     text: "Quizer",
        //     // LoginController().username,
        //     isHeadLine: true,
        //   ),
        // ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: CustomDrawerText(
            text: anaSayfa,
            isHeadLine: false,
          ),
          onTap: () {
            Get.back();
            Get.toNamed('/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.groups_sharp),
          title: CustomDrawerText(
            text: skorTablosu,
            isHeadLine: false,
          ),
          onTap: () {
            Get.back();
            Get.toNamed('/skorTablosu');
          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration_outlined),
          title: CustomDrawerText(text: kayitOl, isHeadLine: false),
          onTap: () {
            Get.toNamed('/register');
          },
        ),
        GapEnum.xxl.heightBox,
        GapEnum.xxl.heightBox,
        GapEnum.xxl.heightBox,
        GapEnum.M.heightBox,
        ListTile(
          leading: const Icon(color: Colors.red, Icons.power_settings_new_outlined),
          title: CustomDrawerText(
            text: cikisYap,
            isHeadLine: false,
            isLogOut: true,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GapEnum.S.heightBox,
                          //unlemIsareti
                          SizedBox(width: Get.width * 0.2, height: Get.height * 0.1, child: Image.asset(unlemIsareti)),
                          GapEnum.S.heightBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              cikisIcinEminMisin,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
                                    buttonText: evet,
                                    buttonColor: Colors.green,
                                    textColor: Colors.white,
                                    onTap: () async {
                                      String cevap = await loginController.validateUser(false);
                                      if (cevap == cikisBasarili) {
                                        Get.toNamed('/exiting');
                                        /* Future.delayed(const Duration(milliseconds: 1500), () {
                                          Get.back();
                                          Get.toNamed('/login');
                                        });*/
                                      } else {
                                        snack();
                                        print("Çıkış başarısız!!");
                                        Future.delayed(const Duration(milliseconds: 1500), () {
                                          Get.back();
                                        });
                                      }
                                    },
                                  ),
                                ),
                                GapEnum.xS.widthBox,
                                SizedBox(
                                  width: Get.width * 0.3,
                                  height: Get.height * 0.05,
                                  child: CustomButton(
                                    buttonText: hayir,
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
                    )));
          },
        ),
      ]),
    );
  }
}

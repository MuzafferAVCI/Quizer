import 'package:design/constant/gap_enum.dart';
import 'package:design/constant/padding_extension.dart';
import 'package:design/controller/quiz_controller.dart';
import 'package:design/widget/custom_answer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/text_constants.dart';
import '../widget/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SoruController soruController = Get.put(SoruController());
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: context.loginHorAndVerPad,
          child: Column(
            children: [
              GapEnum.xL.heightBox,
              const Text(
                'Quizer',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              GapEnum.xxl.heightBox,
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomAnswerButton(
                          buttonColor: Colors.red,
                          text: listening,
                          onTap: () {},
                          topRight: 0,
                          bottomLeft: 0,
                          bottomRight: 0,
                        ),
                        CustomAnswerButton(
                          buttonColor: Colors.blue,
                          text: reading,
                          onTap: () {
                            //cevapları temizle
                            soruController.clearUserAnswers();
                            Get.toNamed('/quizview');
                          },
                          topLeft: 0,
                          bottomLeft: 0,
                          bottomRight: 0,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomAnswerButton(
                          buttonColor: Colors.orange,
                          text: writing,
                          onTap: () {},
                          topRight: 0,
                          topLeft: 0,
                          bottomRight: 0,
                        ),
                        CustomAnswerButton(
                          buttonColor: Colors.green,
                          text: speaking,
                          onTap: () {},
                          topRight: 0,
                          topLeft: 0,
                          bottomLeft: 0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

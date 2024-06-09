import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/skor_tablosu_controller.dart';

class SkorTablosu extends GetView<SkorTablosuController> {
  const SkorTablosu({super.key});

  @override
  Widget build(BuildContext context) {
    SkorTablosuController controller = Get.put(SkorTablosuController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    //Get.toNamed('/home');
                    Get.offAndToNamed('/home');
                  },
                  child: Text(
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                      "Ana sayfa")),
            ),
          ],
          automaticallyImplyLeading: false,
          title: const Text("Skor Tablosu"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
                //1.Başlık:
                Container(
                  width: Get.width * 0.3,
                  height: Get.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Text(style: Theme.of(context).textTheme.titleMedium, "Sıralama"),
                ),
                //2.Başlık:
                Container(
                  width: Get.width * 0.3,
                  height: Get.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Text(style: Theme.of(context).textTheme.titleMedium, "Kullanıcı Adı"),
                ),
                //3. Başlık:
                Container(
                  width: Get.width * 0.3,
                  height: Get.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Text(style: Theme.of(context).textTheme.titleMedium, "Puan"),
                ),
              ]),
            ),
            Expanded(
              child: Obx(() {
                if (controller.scoreTableModel.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else {
                  return ListView.builder(
                      itemCount: controller.scoreTableModel.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //1.Sütun:
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Column(
                                      children: [
                                        Container(
                                            width: Get.width * 0.3,
                                            height: Get.height * 0.05,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child:
                                                Text(style: Theme.of(context).textTheme.titleMedium, "${index + 1}."))
                                      ],
                                    ),
                                  ),
                                  // 2.Sütun:
                                  Container(
                                    color: Colors.green,
                                    width: Get.width * 0.3,
                                    height: Get.height * 0.05,
                                    child: Column(
                                      children: [
                                        Container(
                                            width: Get.width * 0.3,
                                            height: Get.height * 0.05,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Text(
                                                style: Theme.of(context).textTheme.titleSmall,
                                                controller.scoreTableModel[index].username))
                                      ],
                                    ),
                                  ),
                                  //3.Sütun:
                                  Container(
                                    color: Colors.blue,
                                    width: Get.width * 0.3,
                                    child: Column(
                                      children: [
                                        Container(
                                            width: Get.width * 0.3,
                                            height: Get.height * 0.05,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Text(
                                                style: Theme.of(context).textTheme.titleMedium,
                                                controller.scoreTableModel[index].puan))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                }
              }),
            ),
          ],
        ));
  }
}

import 'package:design/models/skor_tablosu_model.dart';
import 'package:design/services/skor_tablosu_service.dart';
import 'package:get/get.dart';

class SkorTablosuController extends GetxController {
  RxList<ScoreTableModel> scoreTableModel = <ScoreTableModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabloGetir();
  }

  void tabloGetir() async {
    var tablo = (await SkorTablosuApiService().skorTablosuGetir())!;

    scoreTableModel.value = tablo;
  }
}

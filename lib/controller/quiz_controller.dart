// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:design/controller/login_controller.dart';
import 'package:design/models/answer_model.dart';
import 'package:design/models/cevap_data_model.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constant/localhost_constant.dart';
import '../models/soru_model.dart';

class SoruController extends GetxController {
  RxBool isDialogVisible = false.obs;
  RxList<SoruModel> soruModel = <SoruModel>[].obs;
  RxInt soruIndex = 0.obs;
  Map<int, String> userAnswers = {};
  int? userId = 0;

  @override
  void onInit() {
    super.onInit();
    getSorular();
    getUserID();
    clearUserAnswers();
  }

  // userAnswers listesini temizlemek için metod
  void clearUserAnswers() {
    userAnswers.clear(); // userAnswers listesini boşalt
  }

  Future<void> getUserID() async {
    LoginController loginController = Get.find<LoginController>();
    userId = loginController.userid;
    print("Alınan kullanıcı ID: $userId");
  }

  void nextQuestion() {
    if (soruIndex.value < soruModel.length - 1) {
      soruIndex.value++;

      print(soruIndex.value);
    } else {
      // Tüm sorular bitince yapılacak işlemler
      soruIndex.value = 0;
      Get.toNamed('/quizFinished');
    }
  }

  void cevabiKaydet(int soruId, String kullaniciCevabi) {
    userAnswers[soruId] = kullaniciCevabi;
    print(userAnswers);
  }

  Future<List<SoruModel>?> getSorular() async {
    Map<String, dynamic> sinavId = {'sinav_id': '1'}; //Json formatında sinav_id
    var url = Uri.http(localHost, '/backend/get_sorular.php'); // API adresi Post için
    print(url);
    try {
      var response = await http.post(url, body: sinavId);

      // JSON dizesini List<dynamic> olarak çözme
      // List<dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        // sorular.value = data; // Gelen JSON verisini saklayın
        soruModel.value = soruModelFromJson(response.body);
        print(soruModel);
        print("-------------- ");

        return soruModel;
      } else {
        // Veri alınamadığında yapılacaklar
        print('Sorular alınamadı. statusCode hata kodu: ${response.statusCode}');
      }
    } catch (e) {
      // Hata durumunda yapılacaklar
      print('getSorular(): Bir hata oluştu: $e');
    }
    return null;
  }

  // Future<int> getUserId() async {
  //   var url = Uri.http(localHost, '/backend/login.php');
  //   final response = await http.get(url);
  //   userId = response.body;
  //   print(" dönen response body -> $userId");
  //   //! kullanıcı id sini al

  //   if (response.statusCode == 200) {
  //     // Baglanti Başarılı
  //     if (response.body != "") {
  //       //!response.body = "" oluyor ona bak
  //       print('getUserId(): kullanıcı id: ${response.body}');
  //       return int.parse(response.body);
  //     } else {
  //       print('getUserId(): kullanıcı id bulunamadı: ${response.body}');
  //       return 0;
  //     }
  //   } else {
  //     // Hata
  //     print('getUserId(): Bağlantı hatası oluştu: ${response.body}');
  //     return 0;
  //   }
  // }

  //!deneme fonksiyonu :
  bool isEncodable(value) {
    try {
      jsonEncode(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> submitExam() async {
    //int kullaniciId = await getUserId();
    String jsonAnswers;

    print("kullanici_id: $userId");
    print("sinav_id: 1");
    print("cevaplar: $userAnswers");

// Kullanici ID'nin geçerli olup olmadığını kontrol et
    if (userId == 0) {
      print('Geçersiz kullanıcı ID: $userId');
      jsonAnswers = userAnswerToJson(userAnswers);
      print("Json formatında useranswers - $jsonAnswers");
      return;
    }
    // Veriyi JSON formatına dönüştürmeden önce kontrol et
    // else if (!isEncodable(userAnswers)) {
    //   print('userAnswers JSON formatına dönüştürülemiyor.');
    //   return;
    // }
    else {
      try {
        // Veriyi JSON formatına dönüştür
        String jsonUserAnswers = userAnswerToJson(userAnswers);
        print("Json formatında useranswers - $jsonUserAnswers");

        Map<String, dynamic> data = {'kullanici_id': userId, 'sinav_id': 1, 'cevaplar': jsonUserAnswers};
        print("data - $data");
        String jsonData = sinavCevapModelToJson(data);

        //List<SinavCevapModel> model = sinavCevapModelToJson(data) as List<SinavCevapModel>;
        //print("model - $model");
        print("jsonData - $jsonData");

        // HTTP POST isteği gönder
        var url = Uri.http(localHost, '/backend/submit_answers.php');
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonData, //jsonData,
        );

        if (response.statusCode == 200) {
          // Başarılı
          var responseData = jsonDecode(response.body);
          print('Doğru cevap sayısı: ${responseData['dogruSayisi']}');
          print('Puan: ${responseData['puan']}');
        } else {
          // Hata
          print('submitExam(): Bağlantı hatası oluştu: ${response.body}');
        }
      } catch (e) {
        print('submitExam(): JSON encode hatası: $e');
      }
    }
  }
}

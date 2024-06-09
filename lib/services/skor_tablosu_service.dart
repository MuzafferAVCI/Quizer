// ignore_for_file: avoid_print

import 'dart:developer';

import '../constant/localhost_constant.dart';
import '../models/skor_tablosu_model.dart';
import 'package:http/http.dart' as http;

class SkorTablosuApiService {
  Future<List<ScoreTableModel>?> skorTablosuGetir() async {
    try {
      var url = Uri.http(localHost, '/backend/skor_tablosu.php');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        //işlem başarılı ise yani statusCode = 200 ise
        List<ScoreTableModel> model = scoreTableModelFromJson(response.body);
        print("responseBody - ${response.body}");
        print("Model - $model");

        //Bizim modele response'un içeriğini yani datayı gönderiyoruz.
        //Ve o list'i "model" diye oluşturdugumuz listeye aktarıyoruz.
        return model;
      } else {
        print("Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
    return null;
  }
}

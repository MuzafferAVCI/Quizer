// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/localhost_constant.dart';

class RegisterController extends GetxController {
  RxBool obsecureText = false.obs;
  RxBool isChecked = false.obs;
  String responseString = "denme";

  TextEditingController userNameEC = TextEditingController();
  TextEditingController eMailEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  TextEditingController nameEC = TextEditingController();
  TextEditingController surNameEC = TextEditingController();

  // ignore: prefer_final_fields

/*
  //Kullanıcının girdiği bilgileri alıyoruz.
  RxString name = ''.obs;
  RxString surname = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
*/

//Future<List>
  registerUser() async {
    //Kullanıcının girdiği bilgileri 'Json' formatına dönüştürüyoruz.
    Map user = {
      "name": nameEC.text,
      "surname": surNameEC.text,
      "username": userNameEC.text,
      "email": eMailEC.text,
      "password": passwordEC.text,
    };
    //Verileri server'a POST edip dönen yanıtı alıyoruz

    var url = Uri.http(localHost, '/backend/register.php');
    final response = await http.post(url, body: user);

//192.168.0.31
    //aşagıdaki kod sıkıntılı!!!!
    //var response = await GetConnect().post('http://192.168.0.31/backend/register.php', user);

    if (response.statusCode == 200) {
      print('aaaa');
      if (response.body == "Kullanıcı başarıyla kaydedildi") {
        // Başarılı yanıt
        print('kayıt başarılı: ${response.body}');
        responseString = response.body;
        return response.body;
      } else {
        print('Kayıt başarısız: ${response.statusCode},${response.body}');
        responseString = response.body;
        return response.body;
      }
    } else {
      // Hata durumu
      print('Hata oluştu: ${response.statusCode},${response.body}');
      responseString = response.body;
      return response.body;
    }
  }
}

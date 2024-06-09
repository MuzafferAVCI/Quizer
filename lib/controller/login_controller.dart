// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:http/http.dart' as http;

import '../constant/localhost_constant.dart';

class LoginController extends GetxController {
  RxBool obsecureText = false.obs;
  RxBool isChecked = false.obs;
  RxInt userId = 0.obs;
  int userid = 0;
  String username = "";

  TextEditingController userNameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();

  // String? userId;

  void clearForm() {
    username = userNameEC.text;
    userid = userId.value;
    userNameEC.clear();
    passwordEC.clear();
  }

  validateUser(bool isLogin) async {
    Map userInfo = isLogin
        ? {
            "username": userNameEC.text,
            "password": passwordEC.text,
            "login": "1",
          }
        : {
            "logout": "1",
          };
    var url = Uri.http(localHost, '/backend/login.php');
    print(url);
    print(userInfo);
    final response = await http.post(url, body: userInfo);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      print(responseBody);

      if (responseBody['status'] == 'success') {
        if (isLogin) {
          //!
          userId.value = responseBody['user_id'];
          print('Giriş başarılı: ${responseBody['message']}, Kullanıcı ID: $userId');
        } else {
          userId.value = 0;
          print('Çıkış başarılı: ${responseBody['message']}');
        }
        return responseBody['message'];
      } else {
        print('İşlem başarısız: ${responseBody['message']}');
        return responseBody['message'];
      }
    } else {
      print('Bağlantı hatası oluştu: ${response.statusCode},${response.body}');
      return 'Bağlantı hatası oluştu';
    }
  }
}

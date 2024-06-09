import 'dart:convert';

List<SoruModel> soruModelFromJson(String str) =>
    List<SoruModel>.from(json.decode(str).map((x) => SoruModel.fromJson(x))).toList();

//10 tane UserModel olan bir liste olacak.

String soruModelToJson(List<SoruModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoruModel {
  final int soruId;
  final String soruMetni;
  final String a;
  final String b;
  final String c;
  final String d;

  SoruModel({
    required this.soruId,
    required this.soruMetni,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  // JSON'dan Soru nesnesine dönüştürme
  factory SoruModel.fromJson(Map<String, dynamic> json) => SoruModel(
        soruId: json['soru_id'],
        soruMetni: json['soru_metni'],
        a: json['a'],
        b: json['b'],
        c: json['c'],
        d: json['d'],
      );

  // Soru nesnesini JSON'a dönüştürme
  Map<String, dynamic> toJson() => {
        'soru_id': soruId,
        'soru_metni': soruMetni,
        'a': a,
        'b': b,
        'c': c,
        'd': d,
      };
}

import 'dart:convert';

// JSON'dan SinavCevapModel nesnesini oluşturma
SinavCevapModel sinavCevapModelFromJson(Map<String, dynamic> json) => SinavCevapModel.fromJson(json);

// SinavCevapModel nesnesini JSON formatına dönüştürme
String sinavCevapModelToJson(Map<String, dynamic> data) {
  return json.encode(data);
}

class SinavCevapModel {
  int kullaniciId;
  int sinavId;
  List<UserAnswer> cevaplar;

  SinavCevapModel({
    required this.kullaniciId,
    required this.sinavId,
    required this.cevaplar,
  });

  factory SinavCevapModel.fromJson(Map<String, dynamic> json) {
    return SinavCevapModel(
      kullaniciId: json['kullanici_id'],
      sinavId: json['sinav_id'],
      cevaplar: List<UserAnswer>.from(
        json['cevaplar'].map((x) => UserAnswer.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kullanici_id': kullaniciId,
      'sinav_id': sinavId,
      'cevaplar': cevaplar.map((x) => x.toJson()).toList(),
    };
  }
}

class UserAnswer {
  int soruId;
  String kullaniciCevabi;

  UserAnswer({required this.soruId, required this.kullaniciCevabi});

  factory UserAnswer.fromJson(Map<String, dynamic> json) {
    return UserAnswer(
      soruId: json['soruId'],
      kullaniciCevabi: json['kullaniciCevabi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soruId': soruId,
      'kullaniciCevabi': kullaniciCevabi,
    };
  }
}

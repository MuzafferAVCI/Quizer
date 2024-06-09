import 'dart:convert';

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

// JSON'dan UserAnswer listesini oluşturma
List<UserAnswer> userAnswerFromJson(String str) =>
    List<UserAnswer>.from(json.decode(str).map((x) => UserAnswer.fromJson(x)));

// UserAnswer haritasını JSON formatına dönüştürme
String userAnswerToJson(Map<int, String> data) {
  List<UserAnswer> userAnswerList = data.entries.map((entry) {
    return UserAnswer(soruId: entry.key, kullaniciCevabi: entry.value);
  }).toList();
  return json.encode(List<dynamic>.from(userAnswerList.map((x) => x.toJson())));
}

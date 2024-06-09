import 'dart:convert';

List<ScoreTableModel> scoreTableModelFromJson(String str) =>
    List<ScoreTableModel>.from(json.decode(str).map((x) => ScoreTableModel.fromJson(x))).toList();

//10 tane UserModel olan bir liste olacak.

String scoreTableModelToJson(List<ScoreTableModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScoreTableModel {
  String username;
  String puan;

  ScoreTableModel({required this.username, required this.puan});

  factory ScoreTableModel.fromJson(Map<String, dynamic> json) => ScoreTableModel(
        username: json['username'],
        puan: json['puan'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['puan'] = puan;
    return data;
  }
}

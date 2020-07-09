import 'package:cloud_firestore/cloud_firestore.dart';

class ThemeModel {
  DocumentReference reference;
  String user;
  int primaryColor;
  int accentColor;
  int buttonColor;

  ThemeModel({this.user, this.primaryColor, this.accentColor, this.buttonColor, this.reference});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['primaryColor'] = this.primaryColor;
    data['accentColor'] = this.accentColor;
    data['buttonColor'] = this.buttonColor;
    return data;
  }

  ThemeModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    primaryColor = json['primaryColor'];
    accentColor = json['accentColor'];
    buttonColor = json['buttonColor'];
  }

  factory ThemeModel.fromDocument(DocumentSnapshot doc) {
    return ThemeModel(
      reference: doc.reference,
      user: doc['user'],
      primaryColor: doc['primaryColor'],
      accentColor: doc['accentColor'],
      buttonColor: doc['buttonColor'],
    );
  }

  @override
  String toString() {
    return " Primary - ${primaryColor.toString()}";
  }
}

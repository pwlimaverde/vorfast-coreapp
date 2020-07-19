import 'package:cloud_firestore/cloud_firestore.dart';

class ThemeModel {
  DocumentReference reference;
  String user;
  int primaryColor;
  int accentColor;
  int buttonColor;
  int primaryR;
  int primaryG;
  int primaryB;
  int accentR;
  int accentG;
  int accentB;

  ThemeModel({
    this.user,
    this.primaryColor,
    this.accentColor,
    this.buttonColor,
    this.reference,
    this.primaryR,
    this.primaryG,
    this.primaryB,
    this.accentR,
    this.accentG,
    this.accentB,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['primaryColor'] = this.primaryColor;
    data['accentColor'] = this.accentColor;
    data['buttonColor'] = this.buttonColor;
    data['primaryR'] = this.primaryR;
    data['primaryG'] = this.primaryG;
    data['primaryB'] = this.primaryB;
    data['accentR'] = this.accentR;
    data['accentG'] = this.accentG;
    data['accentB'] = this.accentB;
    return data;
  }

  ThemeModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    primaryColor = json['primaryColor'];
    accentColor = json['accentColor'];
    buttonColor = json['buttonColor'];
    primaryR = json['primaryR'];
    primaryG = json['primaryG'];
    primaryB = json['primaryB'];
    accentR = json['accentR'];
    accentG = json['accentG'];
    accentB = json['accentB'];
  }

  factory ThemeModel.fromDocument(DocumentSnapshot doc) {
    return ThemeModel(
      reference: doc.reference,
      user: doc['user'],
      primaryColor: doc['primaryColor'],
      accentColor: doc['accentColor'],
      buttonColor: doc['buttonColor'],
      primaryR: doc['primaryR'],
      primaryG: doc['primaryG'],
      primaryB: doc['primaryB'],
      accentR: doc['accentR'],
      accentG: doc['accentG'],
      accentB: doc['accentB'],
    );
  }

  @override
  String toString() {
    return " Primary - $primaryR, $primaryG, $primaryB";
  }
}

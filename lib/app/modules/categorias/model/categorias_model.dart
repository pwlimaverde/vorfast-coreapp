import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriasModel {
  DocumentReference reference;
  String icon;
  String title;

  CategoriasModel({this.icon, this.title, this.reference});

  CategoriasModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    return data;
  }

  factory CategoriasModel.fromDocument(DocumentSnapshot doc) {
    return CategoriasModel(
      reference: doc.reference,
      icon: doc['icon'],
      title: doc['title'],
    );
  }

  @override
  String toString() {
    return " title - $title";
  }
}

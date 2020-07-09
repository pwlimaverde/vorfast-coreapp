import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriasModel {
  DocumentReference reference;
  String id;
  String icon;
  String title;

  CategoriasModel({this.icon, this.title, this.reference, this.id});

  CategoriasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    return data;
  }

  factory CategoriasModel.fromDocument(DocumentSnapshot doc) {
    return CategoriasModel(
      reference: doc.reference,
      id: doc.documentID,
      icon: doc['icon'],
      title: doc['title'],
    );
  }

  @override
  String toString() {
    return " title - $title";
  }
}

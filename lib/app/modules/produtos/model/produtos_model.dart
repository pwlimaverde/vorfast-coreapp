import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'produtos_model.g.dart';

class ProdutosModel extends _ProdutosModelBase with _$ProdutosModel {
  ProdutosModel({
    double preco,
    int estoque,
    List<String> imagens,
    String nome,
    int codigoBarras,
    String descricao,
    Map<String, dynamic> fichaTecnica,
    List opcoes,
  }) : super(
          preco: preco,
          estoque: estoque,
          imagens: imagens,
          nome: nome,
          codigoBarras: codigoBarras,
          descricao: descricao,
          fichaTecnica: fichaTecnica,
          opcoes: opcoes,
        );

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['preco'] = preco;
//    data['estoque'] = estoque;
//    data['imagens'] = imagens;
//    data['nome'] = nome;
//    if (fichaTecnica != null) {
//      data['ficha_tecnica'] = fichaTecnica;
//    }
//    data['codigo_barras'] = codigoBarras;
//    if (detalhes != null) {
//      data['detalhes'] = detalhes;
//    }
//    data['descricao'] = descricao;
//    return data;
//  }

  ProdutosModel.fromDocument({DocumentSnapshot doc, String categoriaBase}) {
    reference = doc.reference;
    id = doc.documentID;
    categoria = categoriaBase;
    preco = doc['preco'] + 0.0;
    estoque = doc['estoque'];
    imagens = doc['imagens'].cast<String>();
    nome = doc['nome'];
    fichaTecnica = doc['ficha_tecnica'];
    codigoBarras = doc['codigo_barras'];
    descricao = doc['descricao'];
    opcoes = doc['opcoes'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Nome - $nome - id - $id";
  }
}

abstract class _ProdutosModelBase with Store {
  DocumentReference reference;
  String categoria;
  String id;
  double preco;
  int estoque;
  List<String> imagens;
  String nome;
  int codigoBarras;
  String descricao;
  Map<String, dynamic> fichaTecnica;
  List opcoes;

  _ProdutosModelBase({
    this.reference,
    this.categoria,
    this.id,
    this.preco,
    this.estoque,
    this.imagens,
    this.nome,
    this.codigoBarras,
    this.descricao,
    this.fichaTecnica,
    this.opcoes,
  });
}

class UserModel {
  String nome;
  String id;
  String email;
  String endereco;
  bool administrador;
  List<int> pedidos;

  UserModel({
    this.nome,
    this.id,
    this.email,
    this.endereco,
    this.pedidos,
    this.administrador = false,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    id = json['id'];
    email = json['email'];
    endereco = json['endereco'];
    pedidos = json['pedidos'].cast<int>();
    administrador = json['administrador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['id'] = this.id;
    data['email'] = this.email;
    data['endereco'] = this.endereco;
    data['pedidos'] = this.pedidos;
    data['administrador'] = this.administrador;
    return data;
  }
}

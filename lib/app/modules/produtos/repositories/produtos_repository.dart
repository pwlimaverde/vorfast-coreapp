import 'package:dio/dio.dart';
import 'interfaces/produtos_repository_interface.dart';

class ProdutosRepository implements IProdutosRepository {
  final Dio client;

  ProdutosRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

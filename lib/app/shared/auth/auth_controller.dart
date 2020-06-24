import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'repositories/interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository repo;

  _AuthControllerBase(this.repo){
    repo.getUser().then(setUser);
  }

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) => user = value;

  @action
  Future googleLogin() async{
    user = await repo.getGoogleLogin();
  }



}

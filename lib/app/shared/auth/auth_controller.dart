import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
//Importes Inteernos
import 'model/user_model.dart';
import 'repositories/interfaces/auth_repository_interface.dart';
import '../utilitario/app_status.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository repo;

  _AuthControllerBase(this.repo) {
    repo.getUser().then(setUser);
    setStatus(AppStatus.none);
  }

  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  @observable
  FirebaseUser currentUser;

  @observable
  UserModel currentUserData;

  @action
  Future<void> novoEmailLogin({UserModel user, String pass}) async {
    currentUser = await repo.novoEmailLogin(user: user, pass: pass);
    if (currentUser != null) {
      currentUserData = user;
      setStatus(AppStatus.success);
    } else {
      currentUserData = null;
    }
  }

  @action
  Future<void> singOut() async {
    await repo.singOut();
    currentUser = null;
    currentUserData = null;
  }

  @action
  setUser(FirebaseUser value) => currentUser = value;

  @action
  Future googleLogin() async {
    currentUser = await repo.getGoogleLogin();
  }
}

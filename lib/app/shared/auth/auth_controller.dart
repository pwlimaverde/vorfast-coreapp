import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> signInEmailLogin({String email, String pass}) async {
    await repo.signInEmailLogin(email: email, pass: pass).then((value) async {
      currentUser = value;
      currentUserData = await repo.getUserData(value.uid);
      setStatus(AppStatus.success);
    }).catchError((e) {
      currentUser = null;
      currentUserData = null;
      setStatus(AppStatus.error..valorSet = "Error - $e");
    });
  }

  @action
  Future<void> novoEmailLogin({UserModel user, String pass}) async {
    await repo.novoEmailLogin(user: user, pass: pass).then((value) {
      currentUser = value;
      currentUserData = user;
      setStatus(AppStatus.success);
    }).catchError((e) {
      currentUser = null;
      currentUserData = null;
      setStatus(AppStatus.error..valorSet = "Error - $e");
    });
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
//Importes Inteernos
import '../model/user_model.dart';
import 'repositories/interfaces/auth_repository_interface.dart';
import '../utilitario/app_status.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository repo;

  _AuthStoreBase(this.repo) {
    repo.getUser().then(setUser);
    setStatus(AppStatus.none);
  }

  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) => status = valor;

  @observable
  FirebaseUser currentUser;

  @observable
  UserModel currentUserData;

  @action
  Future<void> setUser(FirebaseUser value) async {
    if (value != null) {
      currentUser = value;
      currentUserData = await repo.getUserData(value.uid);
    } else {
      currentUser = null;
      currentUserData = null;
    }
  }

  //Funcoes internas
  Future<void> signInEmailLogin({String email, String pass}) async {
    await repo.signInEmailLogin(email: email, pass: pass).then((value) async {
      await setUser(value).then((_) => setStatus(AppStatus.success));
    }).catchError((e) async {
      await setUser(null)
          .then((_) => setStatus(AppStatus.error..valorSet = "Error - $e"));
    });
  }

  Future<void> novoEmailLogin({UserModel user, String pass}) async {
    await repo.novoEmailLogin(user: user, pass: pass).then((value) async {
      await setUser(value).then((_) => setStatus(AppStatus.success));
    }).catchError((e) async {
      await setUser(null)
          .then((_) => setStatus(AppStatus.error..valorSet = "Error - $e"));
    });
  }

  Future<void> singOut() async {
    await repo.singOut();
    await setUser(null);
  }

  Future<void> signInGoogleLogin() async {
    await repo.getGoogleLogin().then((user) async {
      await setUser(user).then((_) => setStatus(AppStatus.success));
    }).catchError((e) async {
      await setUser(null)
          .then((_) => setStatus(AppStatus.error..valorSet = "Error - $e"));
    });
  }
}

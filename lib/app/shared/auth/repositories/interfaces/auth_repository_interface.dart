import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../model/user_model.dart';

abstract class IAuthRepository implements Disposable {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  Future<FirebaseUser> novoEmailLogin({UserModel user, String pass});
  Future<FirebaseUser> signInEmailLogin({String email, String pass});
  Future<UserModel> getUserData(String uid);
  Future<void> singOut();
  Future<void> saveUserData({FirebaseUser userFire, UserModel userData});
}

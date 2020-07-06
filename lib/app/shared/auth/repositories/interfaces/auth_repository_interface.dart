import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../model/user_model.dart';

abstract class IAuthRepository implements Disposable {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  Future getEmailLogin();
  Future<FirebaseUser> novoEmailLogin({UserModel user, String pass});
  Future<void> singOut();
}

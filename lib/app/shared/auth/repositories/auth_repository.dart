import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coreapp/app/shared/utilitario/app_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
//Importes Internos
import '../auth_controller.dart';
import 'interfaces/auth_repository_interface.dart';
import '../model/user_model.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth;
  final Firestore fire;

  AuthRepository({this.auth, this.fire});

  final AuthController authController = Modular.get();

  @override
  Future<FirebaseUser> novoEmailLogin({UserModel user, String pass}) {
    return auth
        .createUserWithEmailAndPassword(
      email: user.email,
      password: pass,
    )
        .then((valor) async {
      await _saveUserData(valor.user, user);
      return valor.user;
    }).catchError((e) {
      authController.setStatus(AppStatus.error..valorSet = "Error - $e");
      return null;
    });
  }

  Future<void> _saveUserData(FirebaseUser userFire, UserModel userData) async {
    await fire.collection("user").document(userFire.uid).setData({
      'nome': userData.nome,
      'id': userFire.uid,
      'email': userData.email,
      'endereco': userData.endereco,
      'administrador': userData.administrador,
    });
  }

  @override
  Future<void> singOut() async {
    await auth.signOut();
  }

  @override
  Future getEmailLogin() {
    // TODO: implement getEmailLogin
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<FirebaseUser> getUser() async {
    return auth.currentUser();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

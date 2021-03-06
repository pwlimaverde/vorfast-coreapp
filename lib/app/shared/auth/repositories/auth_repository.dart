import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//Importes Internos
import 'interfaces/auth_repository_interface.dart';
import '../../model/user_model.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth;
  final Firestore fire;

  AuthRepository({this.auth, this.fire});

  @override
  Future<UserModel> getUserData(String uid) {
    try {
      return fire.collection("user").document(uid).get().then((value) {
        return UserModel.fromDocument(value);
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<FirebaseUser> signInEmailLogin({String email, String pass}) {
    try {
      return auth
          .signInWithEmailAndPassword(
        email: email,
        password: pass,
      )
          .then((value) {
        return value.user;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<FirebaseUser> novoEmailLogin({UserModel user, String pass}) {
    try {
      return auth
          .createUserWithEmailAndPassword(
        email: user.email,
        password: pass,
      )
          .then((valor) async {
        await saveUserData(userFire: valor.user, userData: user);
        return valor.user;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveUserData({FirebaseUser userFire, UserModel userData}) async {
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

    DocumentReference docRef = fire.collection("user").document(user.uid);
    DocumentSnapshot doc = await docRef.get();
    final exists = doc.exists;
    if (!exists) {
      UserModel userData = UserModel();
      userData.nome = user.displayName;
      userData.email = user.email;
      await saveUserData(userFire: user, userData: userData);
    }
    return user;
  }

  @override
  Future<FirebaseUser> getUser() async {
    return await auth.currentUser();
  }

  @override
  Future<bool> recoveryPass({String email}) async {
    return await auth.sendPasswordResetEmail(email: email).then((_) {
      return true;
    }).catchError((e) {
      return false;
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

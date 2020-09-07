import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modular_slidy_teste/app/shared/helpers/firebase_errors.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailPasswordLogin(User user) async {
    try {
      final AuthResult result = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print("login deu certo");
      return result.user;
    } on PlatformException catch (e) {
      print(getErrorString(e.code));
    }
  }

  @override
  Future<void> getEmailPasswordSignUp(
      User user, Function onFail, Function onSuccess) async {
    try {
      final AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      print("cadastro deu certo");
      user.id = result.user.uid;
      user.saveData();
      onSuccess();
    } on PlatformException catch (e) {
      print("erro no repository");
      onFail(getErrorString(e.code));
    }
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
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
        (await _auth.signInWithCredential(credential)).user;
    print("google deu certo");
    return user;
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

/*@override
  Future getFacebookLogin() {
    // TOD: implement getFacebookLogin
    throw UnimplementedError();
  }*/
}

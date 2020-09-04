import 'package:firebase_auth/firebase_auth.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  //Future getFacebookLogin();
  Future getEmailPasswordLogin(User user);
  Future<String> getToken();
  Future getLogout();
}

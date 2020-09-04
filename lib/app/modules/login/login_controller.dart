import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController _auth = Modular.get();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @observable
  bool loading = false;

  @observable
  User user = User();

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await _auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future loginWithEmailPassword(user) async {
    try {
      loading = true;
      var firebaseUser = await _auth.loginWithEmailPassword(user);
      print(firebaseUser.uid);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }
}

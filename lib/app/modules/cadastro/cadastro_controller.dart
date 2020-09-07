import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/auth/auth_controller.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  AuthController _auth = Modular.get();
  User user = Modular.get();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  bool loading = false;

  @action
  Future<void> signUpWithEmailPassword(
      user, Function onFail, Function onSuccess) async {
    try {
      loading = true;
      await _auth.signUpWithEmailPassword(user, onFail, onSuccess);
    } catch (e) {
      loading = false;
      print('erro no cadastro controller');
      print(e);
      onFail(e);
    }
  }
}

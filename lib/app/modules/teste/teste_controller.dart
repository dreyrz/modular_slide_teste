import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/auth/auth_controller.dart';

part 'teste_controller.g.dart';

@Injectable()
class TesteController = _TesteControllerBase with _$TesteController;

class _$TesteController {}

abstract class _TesteControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;

  @action
  Future loginWithEmailPassword(user) async {
    try {
      loading = true;
      await auth.loginWithEmailPassword(user);
    } catch (e) {
      loading = false;
    }
  }
}

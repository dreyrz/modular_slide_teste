import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/helpers/validators.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onSaved: (email) => controller.user.email = email,
                validator: (email) {
                  if (!emailValid(email)) {
                    return "E-mail inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
                onSaved: (password) => {controller.user.password = password},
                validator: (pass) {
                  if (pass.isEmpty || pass.length < 5) {
                    return "Senha inválida";
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (controller.formKey.currentState.validate()) {
                    controller.formKey.currentState.save();
                    controller.loginWithEmailPassword(controller.user);
                  }
                },
                child: Observer(
                  builder: (_) {
                    return controller.loading
                        ? CircularProgressIndicator()
                        : Text("Logar");
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Modular.to.pushNamed("/cadastro");
                },
                child: Text("Cadastrar"),
              ),
              RaisedButton(
                onPressed: controller.loginWithGoogle,
                child: Text('Login with Google'),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/helpers/validators.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';
import 'teste_controller.dart';

class TestePage extends StatefulWidget {
  final String title;
  const TestePage({Key key, this.title = "Teste"}) : super(key: key);

  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends ModularState<TestePage, TesteController> {
  //use 'controller' variable to access controller
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return Text("Login com email e senha");
          }),
        ),
        body: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Emdail'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onSaved: (email) => user.email = email,
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
                onSaved: (password) => {user.password = password, print(user)},
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
                    controller.loginWithEmailPassword(user);
                  }
                },
                child: Text("Logar"),
              ),
              RaisedButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed("/cadastro");
                },
                child: Text("Cadastrar"),
              )
            ],
          ),
        ));
  }
}

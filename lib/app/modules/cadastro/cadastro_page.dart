import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_teste/app/shared/helpers/validators.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
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
                onSaved: (password) => {
                  controller.user.password = password,
                  print(controller.user)
                },
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
                  }
                },
                child: Text("Cadastrar"),
              ),
            ],
          ),
        ));
  }
}

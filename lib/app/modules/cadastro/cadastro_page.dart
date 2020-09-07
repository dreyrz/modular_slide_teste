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
        key: controller.scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome'),
                autocorrect: true,
                onSaved: (name) => controller.user.name = name,
                validator: (name) {
                  if (name.isEmpty) {
                    return "Campo obrigatório";
                  } else if (name.trim().split(' ').length <= 1) {
                    return "Preenche seu nome completo";
                  }
                  return null;
                },
              ),
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
              TextFormField(
                decoration: const InputDecoration(hintText: 'Confirmar Senha'),
                obscureText: true,
                onSaved: (confirmPassword) => {
                  controller.user.confirmPassword = confirmPassword,
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
                    if (controller.user.password !=
                        controller.user.confirmPassword) {
                      controller.scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: const Text("Senhas não coincidem"),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }
                    controller.signUpWithEmailPassword(controller.user,
                        /*onFail*/ (e) {
                      controller.scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Falha ao cadastrar: $e"),
                        backgroundColor: Colors.red,
                      ));
                    }, /*onSuccess*/ () {
                      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                      Modular.to.pushReplacementNamed('/home');
                    });
                  }
                },
                child: controller.loading
                    ? CircularProgressIndicator()
                    : Text("Cadastrar"),
              ),
            ],
          ),
        ));
  }
}

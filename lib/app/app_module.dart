import 'package:modular_slidy_teste/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:modular_slidy_teste/app/app_widget.dart';
import 'package:modular_slidy_teste/app/modules/home/home_module.dart';
import 'package:modular_slidy_teste/app/shared/auth/auth_controller.dart';
import 'package:modular_slidy_teste/app/shared/auth/repositories/auth_repository.dart';
import 'package:modular_slidy_teste/app/shared/models/user.dart';
//import 'package:modular_slidy_teste/app/shared/repositories/localstorage/local_storage_hive.dart';
import 'package:modular_slidy_teste/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:modular_slidy_teste/app/shared/repositories/localstorage/local_storage_share.dart';

import 'modules/cadastro/cadastro_module.dart';
import 'modules/login/login_module.dart';
import 'modules/teste/teste_module.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind((i) => User()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/login',
            module: LoginModule(), transition: TransitionType.fadeIn),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/teste', module: TesteModule()),
        ModularRouter('/cadastro', module: CadastroModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject.of();
}

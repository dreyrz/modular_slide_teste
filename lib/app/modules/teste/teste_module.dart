import 'teste_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'teste_page.dart';

class TesteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TesteController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TestePage()),
      ];

  static Inject get to => Inject<TesteModule>.of();
}

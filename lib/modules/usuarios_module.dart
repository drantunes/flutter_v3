import 'package:flutter/material.dart';
import 'package:flutter_v3/controllers/usuario_controller.dart';
import 'package:flutter_v3/core/load_module.dart';
import 'package:flutter_v3/pages/usuarios_page.dart' deferred as usuarios_page;
import 'package:flutter_v3/repositories/usuario_repository.dart';
import 'package:provider/provider.dart';

class UsuariosModule extends StatelessWidget {
  const UsuariosModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UsuariosRepository>(
          create: (context) => UsuariosRepository(),
        ),
        ChangeNotifierProvider<UsuariosController>(
          create: (context) => UsuariosController(
            usuariosRepository: context.read<UsuariosRepository>(),
          ),
        ),
      ],
      child: LoadModule(
        library: usuarios_page.loadLibrary(),
        module: () => usuarios_page.UsuariosPage(),
      ),
    );
  }
}

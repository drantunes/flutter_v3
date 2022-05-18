import 'package:flutter_v3/controllers/counter_controller.dart';
import 'package:flutter_v3/controllers/usuario_controller.dart';
import 'package:flutter_v3/repositories/usuario_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<CounterController>(
    create: (context) => CounterController(),
  ),
  Provider<UsuariosRepository>(
    create: (context) => UsuariosRepository(),
  ),
  ChangeNotifierProvider<UsuariosController>(
    create: (context) => UsuariosController(
      usuariosRepository: context.read<UsuariosRepository>(),
    ),
  ),
];

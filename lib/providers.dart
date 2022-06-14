import 'package:flutter_v3/controllers/counter_controller.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<CounterController>(
    create: (context) => CounterController(),
  ),
  // ChangeNotifierProvider<PhotosRepository>(
  //   create: (context) => PhotosRepository(),
  // ),
  // Provider<UsuariosRepository>(
  //   create: (context) => UsuariosRepository(),
  // ),
  // ChangeNotifierProvider<UsuariosController>(
  //   create: (context) => UsuariosController(
  //     usuariosRepository: context.read<UsuariosRepository>(),
  //   ),
  // ),
];

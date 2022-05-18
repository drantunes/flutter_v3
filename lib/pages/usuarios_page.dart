import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v3/controllers/usuario_controller.dart';
import 'package:provider/provider.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  // late UsuariosController controller;

  @override
  void initState() {
    super.initState();
    // context.read<UsuariosController>().loadUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Consumer<UsuariosController>(builder: (context, controller, _) {
        final usuarios = controller.usuarios;
        debugPrint('Quantidade na Page: ${usuarios.length}');

        if (usuarios.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.separated(
          itemCount: usuarios.length,
          itemBuilder: (context, int index) => ListTile(
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Image(
                  image: CachedNetworkImageProvider(
                    usuarios[index].avatar ?? controller.avatarDefault,
                  ),
                ),
              ),
            ),
            title: Text(usuarios[index].name),
            subtitle: Text(usuarios[index].email),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => {},
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        );
      }),
    );
  }
}

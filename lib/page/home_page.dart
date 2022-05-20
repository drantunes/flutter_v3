import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v3/controllers/usuario_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  ValueNotifier<Color> color = ValueNotifier(Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UsuariosController>(
        builder: (context, controller, _) {
          final usuarios = controller.usuarios;

          if (usuarios.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.scrolledUnder)) {
                    color.value = Colors.white;
                    return Colors.deepPurple;
                  }
                  color.value = Colors.black87;
                  return Colors.deepPurple.shade50;
                }),
                expandedHeight: 120,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedBuilder(
                      animation: color,
                      builder: (context, _) {
                        return Text(
                          'Clientes',
                          style: TextStyle(color: color.value),
                        );
                      }),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: usuarios.length,
                  (context, int index) => ListTile(
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
                    trailing: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

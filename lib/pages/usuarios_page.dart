import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v3/controllers/usuario_controller.dart';
import 'package:flutter_v3/pages/counter_page.dart';
import 'package:provider/provider.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  late PageController controller;
  ValueNotifier<int> page = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    page.dispose();
    controller.dispose();
    super.dispose();
  }

  updatePage(int newPage) {
    page.value = newPage;
  }

  changePage(int newPage) {
    controller.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const CounterPage(),
            )),
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: updatePage,
        children: [
          Consumer<UsuariosController>(
            builder: (context, controller, _) {
              final usuarios = controller.usuarios;

              if (usuarios.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                key: const PageStorageKey<String>('UsuariosList'),
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
                ),
                separatorBuilder: (_, __) => const Divider(),
              );
            },
          ),
          Consumer<UsuariosController>(builder: (context, controller, _) {
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Text(
                    '${controller.usuarios.length} usuários',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (context, paginaAtual, _) {
            return NavigationBar(
              onDestinationSelected: (value) => changePage(value),
              selectedIndex: paginaAtual,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.list), label: 'Usuários'),
                NavigationDestination(icon: Icon(Icons.plus_one), label: 'Dashboard'),
              ],
            );
          }),
    );
  }
}

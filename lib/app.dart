import 'package:flutter/material.dart';
import 'package:flutter_v3/page/home_page.dart';
import 'package:flutter_v3/theme/tema_custom.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final ValueNotifier<bool> materialNotifier = ValueNotifier(true);
  final MaterialColor colorSeed = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: materialNotifier,
      builder: (context, bool material3, _) {
        return MaterialApp(
          title: 'Flutter 3',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            useMaterial3: material3,
            colorScheme: material3 ? ColorScheme.fromSeed(seedColor: colorSeed) : null,
            primaryColor: !material3 ? colorSeed : null,
            extensions: <ThemeExtension<dynamic>>[
              TemaCustom(
                cor: const Color.fromARGB(34, 109, 57, 141),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(239, 255, 142, 142),
                ),
              ),
            ],
          ),

          // home: MyHomePage(title: 'Flutter 3', material3: materialNotifier),
          // home: const UsuariosPage(),
          home: HomePage(),
          // home: const CounterPage(),
          // home: const ButtonPage(),
        );
      },
    );
  }
}

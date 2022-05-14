import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TemaCustom extends ThemeExtension<TemaCustom> {
  final Color? cor;
  final BoxDecoration? decoration;

  TemaCustom({required this.cor, required this.decoration});

  @override
  TemaCustom copyWith({Color? cor, BoxDecoration? decoration}) {
    return TemaCustom(
      cor: cor ?? this.cor,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  TemaCustom lerp(ThemeExtension<TemaCustom>? other, double t) {
    if (other is! TemaCustom) {
      return this;
    }
    return TemaCustom(
      cor: Color.lerp(cor, other.cor, t),
      decoration: BoxDecoration.lerp(decoration, other.decoration, t),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
          home: MyHomePage(title: 'Flutter 3', material3: materialNotifier),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.material3}) : super(key: key);

  final String title;
  final ValueNotifier<bool> material3;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog Material You'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Esta é a aparência do Alert Dialog'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TemaCustom tema = Theme.of(context).extension<TemaCustom>()!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: _showMyDialog, icon: const Icon(Icons.message))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: tema.decoration,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Os botões foram pressionados:',
                      ),
                      Text(
                        '$_counter vezes',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              height: 56,
              child: ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Incrementar'),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              height: 56,
              child: OutlinedButton(
                onPressed: _incrementCounter,
                child: const Text('Incrementar'),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              height: 56,
              child: TextButton(
                onPressed: _incrementCounter,
                child: const Text('Incrementar'),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              color: tema.cor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: const Text('Mudar para Material 3'),
                  trailing: Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: widget.material3.value,
                    onChanged: (value) => widget.material3.value = value,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: widget.material3.value
          ? NavigationBar(
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'Configurações'),
              ],
              selectedIndex: 0,
            )
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
              ],
            ),
    );
  }
}

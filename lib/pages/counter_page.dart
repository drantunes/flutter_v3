import 'package:flutter/material.dart';

import 'package:flutter_v3/controllers/counter_controller.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    // final controller = context.watch<CounterController>();
    debugPrint('Entrou Build');
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return Text('Counter ${context.watch<CounterController>().count.toString()}');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () => Navigator.of(context).pushNamed('/usuarios'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Os botões foram pressionados:',
                      ),
                      Consumer<CounterController>(
                        builder: (context, controller, _) {
                          return Text(
                            '${controller.count} vezes',
                            style: const TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterController>().increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

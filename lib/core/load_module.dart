import 'package:flutter/material.dart';

class LoadModule extends StatelessWidget {
  final Future<dynamic> library;
  final dynamic module;

  const LoadModule({Key? key, required this.library, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: library,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return module();
        },
      ),
    );
  }
}

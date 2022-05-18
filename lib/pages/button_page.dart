import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home),
            SizedBox(
              width: 24,
            ),
            Text('Botão'),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 80,
          child: ElevatedButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shop),
                Text('COMPRAR'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

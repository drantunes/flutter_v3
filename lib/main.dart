import 'package:flutter/material.dart';
import 'package:flutter_v3/app.dart';
import 'package:flutter_v3/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
}

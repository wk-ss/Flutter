import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/modules/pages/motivation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Esta linha remove o banner de debug
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(45, 11, 81, 0.984)),
        useMaterial3: true,
      ),
      home: Motivation(),
    );
  }
}

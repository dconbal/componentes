import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      //quitar el banner de debug
      debugShowCheckedModeBanner: false,
      home: HomePage(), //el scaffold se crea directamente en el archivo
    );
  }
}

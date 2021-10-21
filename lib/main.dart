import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      //quitar el banner de debug
      debugShowCheckedModeBanner: false,
      //home: HomePage(), //el scaffold se crea directamente en el archivo
      initialRoute: '/',
      routes: getApplicationRoutes(),

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'EN'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
    );
  }
}

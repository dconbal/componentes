import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //const HomePageTemp({Key? key}) : super(key: key);

  final opciones = {"Uno", "Dos", "Tres", "Cuatro", "Cinco"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text("Componentes Text")),
      ),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
              title: Text(item + '!'),
              subtitle: Text("Cualquier cosa"),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                print("Hola");
              }),
        ],
      );
    }).toList();
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text("Componentes"),
        ),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      ListTile(title: Text("Hola mundo")),
      ListTile(title: Text("Hola mundo")),
      ListTile(title: Text("Hola mundo")),
    ];
  }
}

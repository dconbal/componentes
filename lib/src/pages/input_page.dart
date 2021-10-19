import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [_crearInput(), Divider(), _crearPersona()],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("Letras ${_nombre.length}"),
        //Lo que aparecera en el cuadro cuando este vacio
        hintText: "Nombre de la persona",
        //El titulo del cuadro
        labelText: "Nombre",
        //El cuadro de ayuda que saldra debajo del cuadro
        helperText: "Solo es el nombre",
        //El icono que estara dentro del cuadro
        suffixIcon: Icon(Icons.accessibility),
        //El icono que estara delante del cuadro
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }
}

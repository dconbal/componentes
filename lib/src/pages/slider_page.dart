import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //const SliderPage({ Key? key }) : super(key: key);
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _slider = 100.0;
  bool _opcion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text("Pagina Slider")),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño imagen",
      divisions: 20,
      value: _slider,
      min: 10.0,
      max: 400.0,
      onChanged: (_opcion)
          ? null
          : (valor) {
              setState(() {
                _slider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://i.pinimg.com/originals/80/7b/29/807b29f756cc47621f92b3581e263272.jpg"),
      width: _slider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    //return Checkbox(
    //  value: _opcion,
    //  onChanged: (value) {
    //    _opcion = value!;
    //  },
    //);

    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _opcion,
      onChanged: (valor) {
        setState(() {
          _opcion = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _opcion,
      onChanged: (valor) {
        setState(() {
          _opcion = valor;
        });
      },
    );
  }
}

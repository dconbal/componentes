import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  bool _valorCheck = false;
  //crearmos el editing que editara el email
  //que este esta controlado por esta variable
  var txt = TextEditingController();

  List<String> _poderes = ["Volar", "Rayos X", "Super Aliento", "Super Fuerza"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearCheckBox(),
          Divider(),
          _crearBoton(),
          Divider(),
          //_crearIcono(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
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
          txt.text = "Daniel";
          txt.text += valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      controller: txt,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //Lo que aparecera en el cuadro cuando este vacio
        hintText: "Email",
        //El titulo del cuadro
        labelText: "Email",
        //El icono que estara dentro del cuadro
        suffixIcon: Icon(Icons.alternate_email),
        //El icono que estara delante del cuadro
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: !_valorCheck,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //Lo que aparecera en el cuadro cuando este vacio
        hintText: "Password",
        //El titulo del cuadro
        labelText: "Password",
        //El icono que estara dentro del cuadro
        suffixIcon: Icon(Icons.lock_open),
        //El icono que estara delante del cuadro
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        //para quitar el cursor al pulsar
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.year.toString() +
            "-" +
            picked.month.toString() +
            "-" +
            picked.day.toString();
        //Tambien se puede hacer
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        _fecha = formatter.format(picked);
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text("Email: $_email"),
      trailing: Text("Poder: $_opcionSeleccionada"),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach(
      (poder) {
        lista.add(
          DropdownMenuItem(
            child: Text(poder),
            value: poder,
          ),
        );
      },
    );
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
            },
          ),
        )
      ],
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text("Mostrar Contraseña"),
      value: _valorCheck,
      onChanged: (value) {
        setState(() {
          _valorCheck = value!;
        });
      },
    );
  }

  Widget _crearIcono() {
    return Column(
      children: [
        GestureDetector(
          child: FittedBox(
            child: Icon(Icons.password),
          ),
          onTap: () => setState(
            () {
              _valorCheck = !_valorCheck;
            },
          ),
        ),
      ],
    );
  }

  Widget _crearBoton() {
    return Column(
      children: [
        Center(
          child: TextButton(
            child: Text("Mostrar la contraseña"),
            onPressed: () {
              setState(() {
                _valorCheck = !_valorCheck;
              });
            },
          ),
        ),
      ],
    );
  }
}

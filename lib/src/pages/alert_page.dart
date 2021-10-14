import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text('Alert Page'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Navigator.pushNamed(context, 'avatar');
        },
        child: Icon(Icons.arrow_left),
      ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Titulo",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Este es el contenido de la caja de la alerta",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              //TextStyle(fontSize: 20),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancelar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

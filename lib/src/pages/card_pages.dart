import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo1(context),
          SizedBox(height: 30),
          _cardTipo2(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _cardTipo1(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Titulo"),
            subtitle: Text("Esto es una imagen"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text("Cancelar"),
                //Que vuelva a la pagina anterior
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              TextButton(
                //hacer una bandera de madrid emergente
                child: Text("Ok"),
                onPressed: () {
                  _mostrarAlert(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                "https://www.xtrafondos.com/descargar.php?id=5846&resolucion=3840x2160"),
            placeholder: AssetImage('assets/baile.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage(
          //"https://www.xtrafondos.com/descargar.php?id=5846&resolucion=3840x2160"),
          //      "https://pbs.twimg.com/profile_images/1171625670247682048/QDZn9pbM.jpg"),
          //),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Messi messi messi messi"),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2.0, 10.0)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                image: NetworkImage("https://i.redd.it/kqnoewuucyj51.jpg"),
              ),
            ],
          ),
        );
      },
    );
  }
}

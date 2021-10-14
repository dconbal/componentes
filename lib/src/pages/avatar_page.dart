import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Pagina Avatar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.arrow_left),
      ),
    );
  }
}

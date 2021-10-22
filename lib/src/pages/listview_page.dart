import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoadig = false;

  //se ejecutara al entrar en la pagina
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //Controlar que se ha llegado al final de la pagina
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //fetchData();
        _isLoadig = true;
      } else {
        _isLoadig = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text('Lista'),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/baile.gif'),
            image:
                NetworkImage("https://picsum.photos/500/300/?imagen=$imagen"),
          );
        },
      ),
    );
  }

  //metodo
  Future<Null> obtenerPagina1() async {
    final duracion = Duration(seconds: 2);

    new Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duracion);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);

      setState(() {});
    }
  }

  Future fetchData() async {
    _isLoadig = true;

    setState(() {});

    final duracion = Duration(seconds: 3);

    return new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoadig = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoadig) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //CircularProgressIndicator(),
              FloatingActionButton(
                child: Text("mas"),
                onPressed: () {
                  _agregar10();
                },
              ),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}

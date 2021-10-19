import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  String foto =
      "https://i.pinimg.com/280x280_RS/3b/97/05/3b9705c673de99e081fb2f0418cb4354.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: GestureDetector(
                onTap: () => setState(
                  () {
                    foto = "https://pbs.twimg.com/media/Ef9ou8uWsAMAlWB.jpg";
                  },
                ),
              ),
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/280x280_RS/3b/97/05/3b9705c673de99e081fb2f0418cb4354.jpg"),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: GestureDetector(
                child: Text(
                  "SL",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => setState(
                  () {
                    foto =
                        "https://static1.abc.es/media/201207/21/kim-jong-un--644x362.jpg";
                  },
                ),
              ),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/baile.gif'),
            image: NetworkImage(foto),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}

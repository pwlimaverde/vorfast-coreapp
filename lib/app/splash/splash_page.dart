import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//imports internos
import '../shared/theme/theme_controller.dart';


class SplashPage extends StatefulWidget {
  final String title;


  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
  }

  _next() async{
    Modular.to.pushReplacementNamed("/home");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Altera cor"),
            onPressed: (){
//              Modular.get<ThemeController>().setPrimariColor(0xff2F4F4F);
            },
          ),
          RaisedButton(
            child: Text("home"),
            onPressed: (){
              _next();
            },
          ),
        ],
      ),
    );
  }
}

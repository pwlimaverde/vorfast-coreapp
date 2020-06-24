import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_controller.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
            ),
            SizedBox(
              height: 4.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: widgetCore.FlatbuttonCoreWidget(
                title: "Esqueci minha senha",
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: widgetCore.FlatbuttonCoreWidget(
                title: "CRIAR CONTA",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            widgetCore.RaisedbuttonCoreWidget(
              icon: Icon(FontAwesomeIcons.user),
              label: "Login com Email",
              colorButton: Colors.blueGrey,
              onPressed: () {},
            ),
            SizedBox(
              height: 8.0,
            ),
            widgetCore.RaisedbuttonCoreWidget(
              icon: Icon(FontAwesomeIcons.google),
              label: "Login com Google",
              colorButton: Colors.red,
              onPressed: () {},
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

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
              child: controller.flatCoreEsqueci,
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                onPressed: () {},
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

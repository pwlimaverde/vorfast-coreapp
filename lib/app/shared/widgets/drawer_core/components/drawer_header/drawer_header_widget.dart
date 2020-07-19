import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Importes Internos
import '../../../../auth/auth_store.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final AuthStore controllerAuth = Modular.get<AuthStore>();
  final int page;

  DrawerHeaderWidget({this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
      height: 170.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 8.0,
            left: 0.0,
            child: Text(
              "Vorfast \nCore App",
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Observer(builder: (_) {
            if (controllerAuth.currentUserData != null) {
              return Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Olá, ${controllerAuth.currentUserData.nome}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Sair",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            FontAwesomeIcons.signOutAlt,
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        controllerAuth.singOut();
                      },
                    )
                  ],
                ),
              );
            } else {
              return Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Olá, ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Entre ou cadastre-se",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            FontAwesomeIcons.signInAlt,
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        _nav();
                      },
                    )
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  _nav() {
    Modular.to.pop();
    return page == 0 ? null : Modular.to.pushReplacementNamed("/login");
  }
}

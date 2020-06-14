import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
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
          Positioned(
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
                  child: Text(
                    "Entre ou cadastre-se >",
                    style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListMenuWidget extends StatelessWidget {
  Widget header;
  Widget body;

  ListMenuWidget({this.header, this.body});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: 32.0,
        top: 16.0,
      ),
      children: <Widget>[
        header,
        Divider(),
        body,
      ],
    );
  }
}

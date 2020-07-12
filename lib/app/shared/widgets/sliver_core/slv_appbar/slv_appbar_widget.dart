import 'package:flutter/material.dart';

class SlvAppbarWidget extends StatelessWidget {
  final String title;
  final bool isAdmin;
  final Widget editButton;

  const SlvAppbarWidget({
    Key key,
    this.title,
    this.isAdmin,
    this.editButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: <Widget>[
        isAdmin ?? isAdmin == true ? editButton : Container(),
      ],
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}

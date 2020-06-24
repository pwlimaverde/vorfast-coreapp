import 'package:flutter/material.dart';

class SlvAppbarWidget extends StatelessWidget {
  final String title;

  const SlvAppbarWidget({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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

import 'package:flutter/material.dart';

class SliverAppbarHomeWidget extends StatelessWidget {
  String title;


  SliverAppbarHomeWidget(this.title);

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

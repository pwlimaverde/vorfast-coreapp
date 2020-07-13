import 'package:flutter/material.dart';

class SlvCardWidget extends StatelessWidget {
  final Widget body;

  const SlvCardWidget({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: (MediaQuery.of(context).size.height) - 85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: body,
        ),
      ),
    );
  }
}

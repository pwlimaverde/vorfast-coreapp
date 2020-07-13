import 'package:flutter/material.dart';
import '../widgets_core.dart' as widgetCore;

class BodyCoreWidget extends StatelessWidget {
  final int page;
  final List<Widget> slv;

  const BodyCoreWidget({
    Key key,
    this.page,
    this.slv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widgetCore.DrawerCoreWidget(page: page),
      body: Stack(
        children: <Widget>[
          widgetCore.GradientebackCoreWidget(),
          CustomScrollView(
            slivers: slv,
          ),
        ],
      ),
    );
  }
}

// <Widget>[
//               widgetCore.SlvAppbarWidget(
//                 editButton: editButton,
//                 title: title,
//                 isAdmin: isAdmin,
//               ),
//               body ??
//                   SliverToBoxAdapter(
//                     child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                       height: (MediaQuery.of(context).size.height) - 85,
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: card,
//                       ),
//                     ),
//                   ),
//             ]

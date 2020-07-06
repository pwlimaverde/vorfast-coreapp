import 'package:flutter/material.dart';
//Importes internos
import 'components/drawer_back/drawer_back_widget.dart';
import 'components/drawer_header/drawer_header_widget.dart';
import 'components/drawer_tile/drawer_tile_widget.dart';
import 'components/listMenu/listMenu_widget.dart';

class DrawerCoreWidget extends StatelessWidget {
  final int page;

  DrawerCoreWidget({this.page});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          DrawerBackWidget(),
          ListMenuWidget(
            header: DrawerHeaderWidget(),
            body: Column(
              children: <Widget>[
                DrawerTileWidget(
                  indice: 0,
                  page: page,
                  nav: "/",
                  icon: Icons.home,
                  tile: "Inicio",
                ),
                DrawerTileWidget(
                  indice: 1,
                  page: page,
                  icon: Icons.list,
                  tile: "Categorias",
                  nav: "/categorias",
                ),
                DrawerTileWidget(
                  indice: 2,
                  page: page,
                  icon: Icons.playlist_add_check,
                  tile: "Meus Pedidos",
                ),
                DrawerTileWidget(
                  indice: 3,
                  page: page,
                  icon: Icons.location_on,
                  tile: "Lojas",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

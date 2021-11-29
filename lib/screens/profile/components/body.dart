import 'package:flutter/material.dart';
import 'package:shop_app/screens/orquideas/orquideas_screen.dart';
import 'package:shop_app/screens/solicitud_orquideas/solicitud_orquidea.dart';
import 'package:shop_app/screens/solicitud_viveros/solicitud_screen.dart';
import 'package:shop_app/screens/viveros/viveros_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Mi cuenta",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          // ProfileMenu(
          //   text: "Registra tu vivero",
          //   icon: "assets/icons/Registro.svg",
          //   press: () => Navigator.pushNamed(context, ViveroScreen.routeName),
          // ),
          ProfileMenu(
            text: "Registra tu orquidea",
            icon: "assets/icons/Registro.svg",
            press: () =>
                Navigator.pushNamed(context, SolicitudOrquideaScreen.routeName),
          ),
          ProfileMenu(
            text: "Registra tu vivero",
            icon: "assets/icons/Registro.svg",
            press: () =>
                Navigator.pushNamed(context, SolicitudviverosScreen.routeName),
          ),
          ProfileMenu(
            text: "Configuracion",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Centro de ayuda",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cerrar Sesion",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

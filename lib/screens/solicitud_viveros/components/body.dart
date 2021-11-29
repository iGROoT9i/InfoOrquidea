import 'package:flutter/material.dart';
import 'package:shop_app/models/viveros.dart';
import 'package:shop_app/providers/productos_provider.dart';
import 'package:shop_app/screens/orquideas/orquideas_screen.dart';
import 'package:shop_app/screens/viveros/viveros_screen.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  final viveroProvider = new ViveroProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Viveros')),
      body: ViveroScreen(),
    );
  }
}

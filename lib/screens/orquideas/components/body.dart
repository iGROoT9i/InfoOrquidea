import 'package:flutter/material.dart';
import 'package:shop_app/models/orquidea.dart';
import 'package:shop_app/models/viveros.dart';
import 'package:shop_app/providers/orquidea_provider.dart';
import 'package:shop_app/providers/productos_provider.dart';
import 'package:shop_app/screens/form_orquideas/formorquideas.dart';
import 'package:shop_app/screens/form_viveros/formviveros.dart';
import 'package:shop_app/screens/orquideas/orquideas_screen.dart';
import 'package:shop_app/screens/viveros/viveros_screen.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  final orqudieaProvider = new OrquideaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Viveros')),
      body: _crearListado(),

      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: orqudieaProvider.cargarOrquidea(),
      builder:
          (BuildContext context, AsyncSnapshot<List<OrquideaModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, OrquideaModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion) {
          orqudieaProvider.borrarOrquidea(producto.id);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              // (producto.nombre == null)
              //     ? Image(image: AssetImage('assets/no-image.png'))
              //     : FadeInImage(
              //         image: NetworkImage(producto.nombre),
              //         placeholder: AssetImage('assets/jar-loading.gif'),
              //         height: 300.0,
              //         width: double.infinity,
              //         fit: BoxFit.cover,
              //       ),
              ListTile(
                title: Text(
                    '${producto.nombre} - ${producto.tipo} \n duracion: ${producto.duracion}'),
                subtitle: Text(producto.hubicacion),
                onTap: () => Navigator.pushNamed(context, 'producto',
                    arguments: producto),
              ),
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () =>
          Navigator.pushNamed(context, FormOrquideaScreen.routeName),
    );
  }
}


// import 'dart:js';

import 'package:componentes/src/pages/alert_page.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icono_string_util.dart';

import 'package:flutter/material.dart';



//import 'dart:js';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );
      },
    );

  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = []; //Crear lista vacia

      /* if( data == null ) { return []; }     ====>   Esto sirve para que no haya error en el debug con la data 
                                                       pero se reemplaza por initialData: [],
                                                       que hay en el FutureBuilder de Widget_lista()*/
    
    data.forEach( (opt) {
      
      final widgetTemp = ListTile(
        title: Text (opt['texto']),
        leading: getIcon (opt['icon']),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          
          /*final route = MaterialPageRoute(
             builder: (context){             // o se puede colocar como: builder: ( context ) => AlertPage()
              return AlertPage();               Esto solo sirve cuando quiero utilizar una ruta
            }
          ); */ 
         
          Navigator.pushNamed(context, opt['ruta']); // Se utiliza cuando quiero colocar mas de una ruta
        },
      );
    
      opciones..add( widgetTemp)
              ..add (Divider() );

    });

    return opciones;
  }
 
}
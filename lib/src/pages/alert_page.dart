//import 'dart:js';

import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton( 
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location),
         onPressed: () {
           Navigator.pop(context);
         },
      ),
      
    );
  
  }

  void _mostrarAlert( BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,       // Si se pusiera false no permitira alir de l alerta una vez hecho click, en true si te deja salir de Alerta
      builder: (context) {           // el biulder es una funcion que recibe el context como argumento de BuildContext, regresa un Widget

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
          title: Text ('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,   // Se adapta al ancho del contenido interno // modifica el ancho y largo de el menssaje 
            children: <Widget>[
              Text('Este es el contenido de la caja de Alerta'),
              FlutterLogo( size: 100.0)
            ],
          ),
          actions: <Widget> [       // con actions se pueden agregar mas propiedades al AlertDialog
            FlatButton( 
             child: Text('Cancelar'),
             onPressed: () => Navigator.of(context).pop(), // Se utiliza para cerrar la aplicacion
             ),
            FlatButton( 
             child: Text('Ok'),
             onPressed: () => Navigator.of(context).pop(), // Se utiliza para cerrar la aplicacion
             ),
          ]
        );


      }
   
    );   
   
   
   }


}

import 'package:flutter/material.dart';



class CardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body:  ListView(
        padding: EdgeInsets.all(10.0), //o se puede utilizar: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      children: <Widget> [
        _cardTipo1(),
        SizedBox(height: 30.0),
        _cardTipo2(),
        SizedBox(height: 30.0),
        _cardTipo3(),
        SizedBox(height: 30.0),
      ],
      ),
      );
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 10.0, // que tal alta va a estar la tarjeta en relacion a la sombra que va a proyectar
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)), // sombra de los bordes que quiero pronunciar en la tarjeta
      child: Column(
        children: <Widget>[
          ListTile(
          leading: Icon( Icons.photo_album,color: Colors.blue ),
          title:  Text('Tarjetas de Viaje'),
          subtitle: Text('Si desea puede guardar la imagen de su viaje en su album de fotos')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ), 
              FlatButton(
                onPressed: () {},
                child: Text('Ok'), 
              )
           ]
          )
        ]
      )
      
    );

  }

  Widget _cardTipo2() {

    final card = Container(
    
    // clipBehavior: Clip.antiAlias,sirve para que nada de lo que este en la tarjeta se salga del contenido de la misma
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/c/c8/Untersberg_Mountain_Salzburg_Austria_Landscape_Photography_%28256594075%29.jpeg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration( milliseconds: 500),
            height: 250.0,      // tamaño
            fit: BoxFit.cover, // determina el espacio de la imagen
          ),

       //image(
         //image: NetworkImage('https://data.1freewallpapers.com/download/south-island-new-zealand-landscape-reflection-river-forest-fog-mist-high-resolution-images.jpg')
      //),
          Container(
           padding: EdgeInsets.all(10.0),
          child: Text('Salzburg, Austria')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        //color: Colors.blue[100],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.teal[300],      // color de la descripcion de la foto en la tarjeta
            blurRadius: 5.0,            // El tamaño de la sombra que quiero que tenga la tarjeta    
            spreadRadius: 2.0,          // Que tanto quiero que se extienda la sombra
            offset: Offset(2.0, 2.0) // Es la posicion de la sombra/ ambos valores son de tipo double// // Es una lista que tiene una clase y un constructor, sea color, offset, etc
          )
        ] 
        ), 
        child: ClipRRect(  
          borderRadius: BorderRadius.circular(30.0),      //Sirve para cortar cualquier cosa que se encuentre fuera del contenedor
        child: card,
        ),
    );
  }

  Widget _cardTipo3() {

    final card = Container(
    
    // clipBehavior: Clip.antiAlias,sirve para que nada de lo que este en la tarjeta se salga del contenido de la misma
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://img.wallpapersafari.com/desktop/1680/1050/29/10/uz1FLE.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration( milliseconds: 500),
            height: 250.0,      // tamaño
            fit: BoxFit.cover, // determina el espacio de la imagen
          ),

       //image(
         //image: NetworkImage('https://data.1freewallpapers.com/download/south-island-new-zealand-landscape-reflection-river-forest-fog-mist-high-resolution-images.jpg')
      //),
          Container(
           padding: EdgeInsets.all(10.0),
          child: Text('Neuschwanstein castle, Alemania')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        //color: Colors.blue[100],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white,      // color de la descripcion de la foto en la tarjeta
            blurRadius: 5.0,            // El tamaño de la sombra que quiero que tenga la tarjeta    
            spreadRadius: 2.0,          // Que tanto quiero que se extienda la sombra
            offset: Offset(2.0, 2.0)
                // Es la posicion de la sombra/ ambos valores son de tipo double// // Es una lista que tiene una clase y un constructor, sea color, offset, etc
          )
        ] 
        ), 
        child: ClipRRect(  
          borderRadius: BorderRadius.circular(30.0),      //Sirve para cortar cualquier cosa que se encuentre fuera del contenedor
        child: card,
        ),
    );

}

}
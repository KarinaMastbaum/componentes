import 'dart:math';

import 'package:flutter/material.dart';



class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width  =  50.0; // ancho
  double _height =  50.0; // altura
  Color  _color   = Colors.pink;  
 
 BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child:AnimatedContainer(
          duration: Duration(seconds: 1),  // propiedad obligatoria para usar Animated container
          curve: Curves.fastOutSlowIn,     // empieza rapido, termina lento
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
         )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  
  }

    void _cambiarForma() {

      final random = Random();

      setState(() {

        _width  = random.nextInt(300).toDouble();
        _height = random.nextInt(300).toDouble();
        _color  = Color.fromRGBO(                        // que tan trasparente quiero que sea el elemento
        
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
          1); 

        _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );  

      });
    
    }


}
import 'package:flutter/material.dart';



class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
 
  double  _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0), 
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {                       // Crear la barra como si fuese de sonido, para bajar y subir volumen

    return Slider(
      activeColor: Colors.lightBlue[300],
      label: 'Tamaño de la imagen',   // Cuando clickeas es el texto que te define que estas modificando
     // divisions: 20,              
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck ) ? null : (valor){                       // si el bloquearchek es verdadero entonces seria null, no se puede modificar, si es false se le cambia el tamaño a la foto
       setState(() {
         _valorSlider = valor;
       });
      },              // va a recibir el valor del Slider

    );
  }



  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/aa/fc.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

  Widget _checkBox() {

   /* return CheckBox(                              // Regresa un booleano
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
        _bloquearCheck = valor;   
        });
      },

    );*/
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {

        setState(() {
          _bloquearCheck = valor;
        });
      },


    );

  }

  Widget _crearSwitch() {                           // Para bloquear el Slider, barrita tipo alarma para desactivar 

     return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {

        setState(() {
          _bloquearCheck = valor;
        });
      },
      );  
  }


}
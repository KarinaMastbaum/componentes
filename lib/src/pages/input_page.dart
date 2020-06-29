import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
  @override
 _InputPageState createState() => _InputPageState();
 
 }
 
  class _InputPageState  extends State<InputPage> {

      String _nombre = '';
      String _email = '';
      String _password = '';
      String _fecha = '';       //datepicker: selector de fecha
      String _documentos= '';

      String _opcionSeleccionada = 'D.N.I';

      List<String>_documento = ['D.N.I', 'Licencia de conducir', 'Pasaporte', 'P. NAC'];

      TextEditingController _inputFieldDateController = new TextEditingController(); // relaciona el valor que selecciona la persona con la caja de texto
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context),
          Divider(),
           _crearDropdown(),    //para lograr que se despliguen varios items internos
          Divider(),
          _crearDocumentoIdentidad(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }
  Widget _crearInput() {

    return TextField(          // Campo de texto
      //autofocus: true,      // coloca directamente el foco
      textCapitalization: TextCapitalization.sentences,      // Pone Mayuscula
      decoration: InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text ('Letras ${_nombre.length}'),    // luego se reemplaza por la cantidad de caracteres que tengo
        hintText: 'Nombre de la persona',                     // Texto de sugerencia
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon( Icons.accessibility ),   // ICono
        icon: Icon ( Icons.account_circle ),
      ),
      
      onChanged: (valor) {                       // onChanged: para que queden registrados los datos que se ingresan
        setState(() {
          _nombre = valor;
        });
      },
    );
  }


  Widget _crearEmail() {
 
    return TextField(
      keyboardType: TextInputType.emailAddress,     // para ingresar el email
      //autofocus: true,      // coloca directamente el foco
      textCapitalization: TextCapitalization.sentences,      // Pone Mayuscula
      decoration: InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text ('Letras ${_email.length}'),    // luego se reemplaza por la cantidad de caracteres que tengo
        hintText: 'Email',                     // Texto de sugerencia
        labelText: 'Email',
        suffixIcon: Icon( Icons.alternate_email ),   // ICono
        icon: Icon ( Icons.email ),
      ),
      
      onChanged: (valor) {                       // onChanged: para que queden registrados los datos que se ingresan
        setState(() {
          _email= valor;
        });
      },
    );

}


  Widget _crearPassword(){
    return TextField(
      obscureText: true,    // Se utiliza para poner la contraseña
        textCapitalization: TextCapitalization.sentences,     
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            counter: Text ('Letras ${_password.length}'),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon( Icons.lock_open ),
            icon: Icon ( Icons.lock ),
          ),
     
          onChanged: (valor) {                       // onChanged: para que queden registrados los datos que se ingresan
            setState(() {
            _password= valor;
            });
          },
    );

  }

  
  Widget _crearFecha( BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,     // Quitar la seleccion interactiva     
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            counter: Text ('Letras ${_password.length}'),
            hintText: 'fecha de nacimiento',
            labelText: 'fecha de nacimiento',
            suffixIcon: Icon( Icons.perm_contact_calendar ),
            icon: Icon ( Icons.calendar_today ),
          ),
          onTap: (){

          FocusScope.of(context).requestFocus(new FocusNode());  //apenas hago click en el elemento se quieta el foco
          
          _selectDate ( context );
          
          },
    );

  }

  _selectDate( BuildContext context ) async {

    DateTime picked = await showDatePicker(            //valor de la fecha que selecciona la persona
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime (1990),
      lastDate: new DateTime(2025),
    ); 
    
    if ( picked != null) {              // Si picked es diferente de null va a recibir un dato, esta regresando algo

      setState(() {
        _fecha = picked.toString();      // selecciona la fecha que ingresa la persona
        _inputFieldDateController.text = _fecha;   // para llenar la caja de texto con el valor / 
      });      

    }                                 

  }  

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

  List<DropdownMenuItem<String>> lista = new List();

    _documento.forEach ( (documentos) {

      lista.add( DropdownMenuItem (
      child: Text(documentos),
      value: documentos,
 
      ));
    });

    return lista;
}


  Widget _crearDropdown() {

    return Row(
        children: <Widget>[
          Icon(Icons.select_all),
          SizedBox(width: 30.0), 
          DropdownButton(
            value: _opcionSeleccionada,                   // el value se utiliza para guardar la opcion actual que estoy seleccionando
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          )
        ]
    );

  }


  Widget _crearDocumentoIdentidad() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,      // Pone Mayuscula
      decoration: InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text ('Letras ${_documentos.length}'),    // luego se reemplaza por la cantidad de caracteres que tengo
        hintText: 'Documento de identidad',                     // Texto de sugerencia
        labelText: 'Documento de identidad',
        suffixIcon: Icon( Icons.perm_identity ),   // ICono
        icon: Icon ( Icons.perm_identity ),
      ),
      
      onChanged: (valor) {                       // onChanged: para que queden registrados los datos que se ingresan
        setState(() {
          _documentos= valor;
        });
      },
    );
  } 

  
  Widget _crearPersona() {
    return ListTile(
     title: Text( 'Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }

}
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es, ES'), // Español
      ],
      initialRoute: '/',
      routes: getApplicationRoutes (),
      // home: HomePage(),
);
     
       /*<String, WidgetBuilder>{
        '/'       : (BuildContext context ) => HomePage(),
        'alert'   : (BuildContext context ) => AlertPage(),
        'avatar'  : (BuildContext context ) => AvatarPage(),
      },*/  //Ya lo utilizo en la page "routes.dart"
      
      /*onGenerateRoute: ( RouteSettings settings){     //Ruta Card: Esto se utiliza para llamar a la ruta que no fue declarada en routes ahi arriba
        print( 'Ruta llamada: ${ settings.name }' );
        return MaterialPageRoute(
          builder: ( BuildContext context) => AlertPage()
        );
      }*/
  }
}
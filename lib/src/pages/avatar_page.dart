import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[     // Es una lista de Widget,  se puede colocar cualquier cosa
         
         CircleAvatar(
           backgroundImage: NetworkImage('https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzQzMTY2NDc4/will-smith-9542165-1-402.jpg'),
            minRadius: 30.0,
         ), 
         
          Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.blue[50],
              ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://media.voltron.voanews.com/Drupal/01live-166/styles/sourced/s3/2019-06/B9C71DE4-7959-4F61-96F7-26B4AED1BE4B.jpg?itok=PFXgtuEW'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration( milliseconds: 200),
        )
      )
      
    );
  }
}
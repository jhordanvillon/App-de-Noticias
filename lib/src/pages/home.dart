import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //linea que define el tamaño de la pantalla del dispositivo 
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        //defino los tamaños del container principal 
        height:size.height,   //todo el largo de la pantalla 
        width:size.width,     //todo el tamaño de la pantalla ancha
        //creo un listview
        child: ListView(
          children: [
            _card(),
            _card(),
            _card(),
            _card()
          ],
        ),

         decoration: BoxDecoration( 
             gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                  Color(0XFFFCBB6D),
                  Color(0XFFB46D7E),
                  Color(0XFF94687D),
                  Color(0XFF71637B),
                  Color(0XFF475C7A),
            ]),
          ),
         
      )
    );
  }
  Widget _card(){
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding:EdgeInsets.symmetric(horizontal:10),
      child:  Container(
        decoration:BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.only(top: 20),
        height: 200,
        width: 200,
      )
    );

  }

}
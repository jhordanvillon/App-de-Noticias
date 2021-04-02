import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          
        child:Column(
          children:[
             SizedBox(height: 60),
            _campoTexto(placeholder: 'Email', isPassword:false),
            _campoTexto(placeholder: 'Nombre', isPassword:false),
            _campoTexto(placeholder: 'Password', isPassword:true),
            _campoTexto(placeholder: 'Re - Password', isPassword:true),  
              SizedBox(height: 25),
            _botonRegistrarse(),
            Expanded(child: 
            Container(

            )),
            _regresarLogin(context: context)
          ],
        ),


      ),
    );
  }


  Widget _campoTexto({String placeholder, bool isPassword }){
    return  Container( 
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  } 
 Widget _botonRegistrarse(){
   return Container(
            child: Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0XFFFCBB6D),
                    ]),
              ),
              child: Center(child: Text('Registrarse')),
            ),

  ); 
 }
  Widget _regresarLogin({BuildContext context}){
return 
  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Tienes cuenta?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              CupertinoButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0XFFFCBB6D)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  })
            ],
          );
    
  }
}
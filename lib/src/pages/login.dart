import 'package:app_de_noticias/src/api/Auth_Api.dart';
import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BGColor.decor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.35),
              _campoTexto(placeholder: 'Email', isPassword: false,controller: emailCtrl),
              _campoTexto(placeholder: 'Password', isPassword: true,controller: passCtrl),
              SizedBox(height: 25),
              _login(context: context),
              SizedBox(
                height: size.height * 0.35,
              ),
              _signIn(context: context)
            ],
          ),
        ),
      ),
    ));
  }

  Widget _campoTexto({String placeholder, bool isPassword,TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        
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

  Widget _login({BuildContext context}) {
    return GestureDetector(
      onTap: () async{
        final isOk = await AuthenticationApi.instance.login(context: context, email: emailCtrl.text, password: passCtrl.text);
        if(isOk){
          Navigator.pushReplacementNamed(context, 'home');
        }
      },
      child: Container(
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
          child: Center(child: Text('Ingresa')),
        ),
      ),
    );
  }

  Widget _signIn({BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Eres nuevo?',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        CupertinoButton(
          child: Text(
            'Regístrate',
            style: TextStyle(color: Color(0XFFFCBB6D)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'signin');
          }
        )
      ],
    );
  }
}

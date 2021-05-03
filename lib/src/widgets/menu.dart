import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Jhordan Villon',style: TextStyle(fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Ingeniero'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Menu',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              _opciones(icon: Icons.home,titulo: 'Inicio',context: context,nombreRuta: 'home'),
              _opciones(icon:Icons.person,titulo:'Perfil',context: context,nombreRuta: 'perfil'),
              _opciones(icon:Icons.logout,titulo:'Salir',context: context,nombreRuta: 'login')
            ],
          ),
        ),
      ),
    );
  }

  Widget _opciones({IconData icon,String titulo,BuildContext context,String nombreRuta}){
    return ListTile(
      onTap: (){
        if(nombreRuta != ''){
          Navigator.pushNamed(context, nombreRuta);
        }
      },
      leading: Icon(icon),
      title: Text(titulo),
    );
  }
}
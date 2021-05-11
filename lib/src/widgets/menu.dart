import 'package:app_de_noticias/src/api/Usuario_Api.dart';
import 'package:app_de_noticias/src/model/usuario_model.dart';
import 'package:app_de_noticias/src/services/Auth.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              FutureBuilder(
                future: UsuarioApi.instance.obtenerInfo(),
                builder:
                    (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                  if (snapshot.hasData) {
                    final usuario = snapshot.data;
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: Center(
                              child: Text('${usuario.nombre.substring(0,1).toUpperCase()}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0XFFFCBB6D),
                                borderRadius: BorderRadius.circular(60)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${usuario.nombre}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${usuario.email}'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Menu',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              _opciones(
                  icon: Icons.home,
                  titulo: 'Inicio',
                  context: context,
                  function: () {
                    Navigator.pushNamed(context, 'home');
                  }),
              _opciones(
                  icon: Icons.logout,
                  titulo: 'Salir',
                  context: context,
                  function: () async {
                    await Auth.instance.logOut(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _opciones(
      {IconData icon, String titulo, BuildContext context, Function function}) {
    return ListTile(
      onTap: function,
      leading: Icon(icon),
      title: Text(titulo),
    );
  }
}

import 'package:app_de_noticias/src/pages/categorias.dart';
import 'package:app_de_noticias/src/pages/paraTi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>new _NavegacionModel(),//Manejador de estados para definir en que pantalla estoy
      child: Scaffold(
        bottomNavigationBar: _Navegacion(),
        body: _Paginas()
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (indice){
        navegacionModel.paginaActual = indice;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label:'Para ti'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label:'Mis noticias'
        )
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel._pageController,
      physics: NeverScrollableScrollPhysics(),//para q no se pueda hacer scroll
      children: [
        ParaTiPage(),
        CategoriasPage()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0; //seteamos la pagina en 0 para q al iniciar empieze al inicio
  PageController _pageController = new PageController(); // creamos un controlador para manerjar las paginas

  int get paginaActual => this._paginaActual; // metodo get para llamar a la pagina actual

  //metodo set para cambiar el valor de la pagina actual
  set paginaActual(int valor){
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;//metodo get para el controlador


}
//import 'package:biblioteca_p1/Telas/paginas/confg_ui.dart';

//import 'package:bibliotec_s2/Widgets/blocas002.dart';
import 'package:bibliotec_s2/pages/menu/listadelivros.dart';
import 'package:flutter/material.dart';
import 'menu_do_usuario.dart';
//import '/Telas/paginas/confg_ui.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Índice da página que será carregada inicialmente
  var telaAtual = 0;

  //Controlador utilizado para troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: PageView(
        controller: pageController,
        children: [
          lista_acervo_listview(),
          //FeedBlocos01(),
          Painel_de_colecoes(),
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),
      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red.shade900,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.yellowAccent.withOpacity(.50),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
        //Index do Botão Selecionado
        currentIndex: telaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Opções',
          ),
        ],
        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}

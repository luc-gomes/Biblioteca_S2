
// ignore_for_file: camel_case_types
import 'minha_conta.dart';
import 'package:bibliotec_s2/View/pages/Feeds/lista_acervo_com_fotos.dart';
import 'package:flutter/material.dart';
import 'Main_menu.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var telaAtual = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: PageView(
        controller: pageController,
        children: [
        Minha_conta(), // MINHA CONTA VIZIO
        Dashboard_adm(),
        Lista_acervo_listview(),
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
        currentIndex: telaAtual,
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paste),
            label: 'Operações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
          ),
         
          
        ],
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}


import 'package:bibliotec_s2/View/pages/Feeds/lista_acervo_com_fotos.dart';
import 'package:flutter/material.dart';
import 'menu_opcoes_admin.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red.shade900,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.yellowAccent.withOpacity(.50),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
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

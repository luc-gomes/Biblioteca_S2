
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
            icon: Icon(Icons.psychology_alt_rounded ),
            label: 'Opções',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Home',
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

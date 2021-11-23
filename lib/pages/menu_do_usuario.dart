import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Menu_user extends StatefulWidget {
  const Menu_user({ Key? key }) : super(key: key);

  @override
  _Menu_userState createState() => _Menu_userState();
}

// ignore: camel_case_types
class _Menu_userState extends State<Menu_user> {
  
  

  bottomNavigationBar() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            flexibleSpace:  FlexibleSpaceBar(title: Text("Biblioteca_S2"),
            background:  Image.network(
          'https://cdn.pixabay.com/photo/2017/09/14/11/13/water-2748657_960_720.png',
          
            
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container( 
                height: 100,
                color:  Colors.amber,
              ),
              Container( 
                height: 100,
                color:  Colors.blue,
              ),

      ],),
        ),
        
        



        ],),
        
   );
  }
}

// ignore: camel_case_types
class Painel_de_colecoes extends StatefulWidget {
  const Painel_de_colecoes({ Key? key }) : super(key: key);

  @override
  _Painel_de_colecoesState createState() => _Painel_de_colecoesState();
}

// ignore: camel_case_types
class _Painel_de_colecoesState extends State<Painel_de_colecoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text('Opções'),
      backgroundColor: Colors.green.shade500,
      //actions: [IconButton(icon: Icons.access_alarm,)],
      
      ),
      
      body:
          Container(
            //
            // cor do fundo
            color: Colors.green.shade600,
            //
            //

            child: GridView.count(
            
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              //---------------------------------------------------------------------

              Container(// NOVA HISTORIA
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                               Navigator.pushNamed(context, '/NovaHistoria');
                               Icon(Icons.favorite_border_sharp);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text(
                        'Nova historia',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade200,
              ),
              Container(//criativo
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.book_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                         
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.headphones);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text(
                        'Minhas Hitorias',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade200,
              ),
              Container( // ajuda
                
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.help_center_sharp),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.help_center_sharp);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                      
                      child: Text(
                        'ajuda',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade400,
              ),
              Container(//sobre

                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.info_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                             
                        /*    var obj = Dados(
                             var nome.text,
                              email.text,
                              nickname.text,
                            );
*/
                         //   Navigator.pushNamed(context, '/t4', arguments: obj);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child: Text(
                        'sobre',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade400,
              ),
              Container(//conta
 
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        //icon button sconta
                        icon: Icon(Icons.account_box_sharp),
                        iconSize: 60,
                        color:Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.account_box_sharp);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                    
                      
                      child: Text(
                        'conta',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade600,
              ),
              Container(//sair
         
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//icon button sair
                      child: IconButton(
                        icon: Icon(Icons.logout_sharp),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () async {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(context, '/login');
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.logout_sharp);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text(
                        'sair',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade600,
              ),
            ],
    ),
          ),

      
    //extendBody: bottomNavigationBar(bottomNavigationBar: ,) ,, ,
      );
      

    

  }
}

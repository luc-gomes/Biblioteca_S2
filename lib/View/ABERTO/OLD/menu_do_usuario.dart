import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      title: Text('Menu'),
      backgroundColor: Colors.red,
      ),
      body:
//------------------------------------------------------------------------------
          Container(
            color: Colors.blue.shade700,
            child: GridView.count(          
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
//---------------------------------------blocos menu----------------------------
              Container(//Blocos 0 - Nova Historia
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
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
                        'Cadastar nova historia',
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
//------------------------------------------------------------------------------
              Container(//Blocos 1 - Lista de historias
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.book_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Listar_acervo');
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.headphones);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text(
                        'Lista de historias',
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
//------------------------------------------------------------------------------
              Container(//Blocos 2 - Catalogo aberto

                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.view_day_outlined),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Tela_Inicial');
                          setState(() {
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child: Text(
                        'catalogo',
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
//------------------------------------------------------------------------------
              Container(//Blocos 3 - Usuarios

                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.supervised_user_circle),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                        //  Navigator.pushNamed(context, '/sobre');
                          setState(() {
                             
               
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child: Text(
                        'usuarios',
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
//------------------------------------------------------------------------------
              Container(//Blocos 4 - Sobre

                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.info_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/sobre');
                          setState(() {
                                                 
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
//------------------------------------------------------------------------------              
              Container(//Blocos 5 - Ajuda
                
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
//------------------------------------------------------------------------------
              Container(//Blocos 6 - Conta
 
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
                          Navigator.pushNamed(context, '/Minha_conta');
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

//------------------------------------------------------------------------------
              Container(//Blocos 7 - Log_out
         
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
//------------------------------------------------------------------------------
            ],
    ),
          ),
      );
  }
}

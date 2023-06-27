import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Dashboard_adm extends StatefulWidget {
  const Dashboard_adm({ Key? key }) : super(key: key);

  @override
  _Dashboard_admState createState() => _Dashboard_admState();
}
// ignore: camel_case_types
class _Dashboard_admState extends State<Dashboard_adm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
      title: Text('Menu'),
      backgroundColor: Colors.black,
      ),
      body:
//------------------------------------------------------------------------------
          Container(
            color: Colors.brown.shade300,
            child: GridView.count(          
            primary: false,
            padding: const EdgeInsets.all(30),
            crossAxisSpacing: 20,
            mainAxisSpacing: 50,
            crossAxisCount: 3,
            children: <Widget>[
//---------------------------------------blocos menu----------------------------
              Container(//Blocos 0 - Nova Historia
                            
                child: Column(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                               Navigator.pushNamed(context, '/NovaHistoria');
                               Icon(Icons.favorite_border_sharp);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child:Align(alignment: Alignment.center,
                        child:  Text(
                        'Add Historia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
              Container(//Blocos 1 - Lista de historias
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.book_rounded),
                        iconSize: 40,
                        color: Colors.black,
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
                    child:Align(alignment: Alignment.center,
                        child: Text(
                          
                        'Lista acervo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
              Container(//Blocos 2 - Catalogo aberto

                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.view_day_outlined),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, '/AcervoListview');
                          setState(() {
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'catalogo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
              Container(//Blocos 3 - Usuarios

                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.supervised_user_circle),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                        //  Navigator.pushNamed(context, '/sobre');
                          setState(() {
                             
               
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'Opçoes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
              Container(//Blocos 4 - Sobre

                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.info_rounded),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, '/sobre');
                          setState(() {
                                                 
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'sobre',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
               color: Colors.transparent,
              ),
//------------------------------------------------------------------------------              
              Container(//Blocos 5 - Ajuda
                
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.help_center_sharp),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.help_center_sharp);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                      
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'Ajuda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
              Container(//Blocos 6 - Conta
 
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        //icon button sconta
                        icon: Icon(Icons.account_box_sharp),
                        iconSize: 40,
                        color: Colors.black,
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
                    
                      
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'Conta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),

//------------------------------------------------------------------------------
              Container(//Blocos 7 - Log_out
         
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Container(//icon button sair
                      child: IconButton(
                        icon: Icon(Icons.logout_sharp),
                        iconSize: 40,
                        color: Colors.black,
                        onPressed: () async {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(context, '/login_improved');
                          setState(() {
                            // colocar alguma ação aqui
                            Icon(Icons.logout_sharp);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child:Align(alignment: Alignment.center,
                        child: Text(
                        'Sair',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),),
                  ],
                ),
                color: Colors.transparent,
              ),
//------------------------------------------------------------------------------
            ],
    ),
          ),
      );
  }
}

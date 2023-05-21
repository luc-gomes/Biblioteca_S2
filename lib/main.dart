// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:bibliotec_s2/View/ABERTO/INICIO/Tela_inicial.dart';
import 'package:bibliotec_s2/View/ABERTO/INICIO/conteudo.dart';
import 'package:bibliotec_s2/View/ABERTO/OLD/Tela_sobre.dart';
import 'package:bibliotec_s2/View/ABERTO/OLD/home.dart';
import 'package:bibliotec_s2/View/ABERTO/OLD/listadelivros.dart';
import 'package:bibliotec_s2/View/ABERTO/OLD/menu_do_usuario.dart';
import 'package:bibliotec_s2/View/ABERTO/OLD/minha_conta.dart';
 
import 'package:bibliotec_s2/View/USER/OLD/construtor_historia.dart';
import 'package:bibliotec_s2/View/USER/OLD/nova_historia.dart';
import 'package:bibliotec_s2/Widgets/blocas002.dart';
import 'package:bibliotec_s2/arquivo%20morto/listar_acervo.dart';
 // imports firebse
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
 // imports firebase end
import 'View/interface de introdução.dart';
import 'arquivo morto/cadastro.dart';
import 'pages/Formularios/criar_conta.dart';
import 'pages/login.dart';
 
Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/TELA_INICIAL',
      routes: {

        //-------------------------------------------------------------------
        //-------------OLD
        '/login': (context) => LoginPage(),
        '/criar_conta': (context) => CriarContaPage(),
        '/FeedBlocos01': (context) => FeedBlocos01(),
        '/cadastro': (context) => CadastroPage(),
        '/menu_opcoes': (context) => Painel_de_colecoes(),
        '/NovaHistoria': (context) => NovaHistoria(),
        '/Listar_acervo': (context) => Listar_acervo(),
        '/HOME': (context) => HomePage(),
        '/sobre': (context) => Tela_sobre(),
         '/Minha_conta': (context) => Minha_conta(),
          '/AcervoListview': (context) => lista_acervo_listview(),
          '/Intro': (context) => Introapp(),
          '/Tijolometro': (context) => Tijolometro(),



          //-------------------------------------------------------------------
          //-------------NEW
          '/TELA_INICIAL': (context) => Tela_Inicial_ABERTO(),
          '/POST': (context) => ViewPost(),

          

           


         
      },
    ),
  );
}

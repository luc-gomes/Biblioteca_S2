// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:bibliotec_s2/Widgets/blocas002.dart';
import 'package:bibliotec_s2/View/Consumidor/Tela_sobre.dart';
import 'package:bibliotec_s2/arquivo%20morto/listar_acervo.dart';
import 'package:bibliotec_s2/View/Consumidor/home.dart';
import 'package:bibliotec_s2/View/Consumidor/listadelivros.dart';
import 'package:bibliotec_s2/View/Consumidor/menu_do_usuario.dart';
import 'package:bibliotec_s2/View/Criador/nova_historia.dart';
import 'package:bibliotec_s2/View/Consumidor/minha_conta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'View/Criador/construtor_historia.dart';
import 'View/interface de introdução.dart';
import 'arquivo morto/cadastro.dart';
import 'pages/Formularios/criar_conta.dart';
import 'pages/login.dart';
import 'View/Consumidor/menu_do_usuario.dart';
Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
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


         
      },
    ),
  );
}

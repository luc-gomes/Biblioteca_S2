// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:bibliotec_s2/Widgets/blocas002.dart';
import 'package:bibliotec_s2/pages/Tela_sobre.dart';
import 'package:bibliotec_s2/pages/listar_acervo.dart';
import 'package:bibliotec_s2/pages/menu/home.dart';
import 'package:bibliotec_s2/pages/menu/menu_do_usuario.dart';
import 'package:bibliotec_s2/pages/Formularios/nova_historia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/Formularios/cadastro.dart';
import 'pages/Formularios/criar_conta.dart';
import 'pages/login.dart';
import 'pages/menu/menu_do_usuario.dart';
Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/HOME',
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
      },
    ),
  );
}

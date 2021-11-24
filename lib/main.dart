// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:bibliotec_s2/pages/listar_acervo.dart';
import 'package:bibliotec_s2/pages/menu_do_usuario.dart';
import 'package:bibliotec_s2/pages/nova_historia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/cadastro.dart';
import 'pages/criar_conta.dart';
import 'pages/login.dart';
import 'pages/menu_do_usuario.dart';
Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu_opcoes',
      routes: {
        '/login': (context) => LoginPage(),
        '/criar_conta': (context) => CriarContaPage(),
       // '/principal': (context) => PrincipalPage(),
        '/cadastro': (context) => CadastroPage(),
        '/menu_opcoes': (context) => Painel_de_colecoes(),
        '/NovaHistoria': (context) => NovaHistoria(),
         '/Listar_acervo': (context) => Listar_acervo(),
      },
    ),
  );
}

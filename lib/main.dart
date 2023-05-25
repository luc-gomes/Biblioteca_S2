import 'package:bibliotec_s2/View/Tela_inicial_feed_aberto.dart';
import 'package:bibliotec_s2/View/conteudo_publicacao.dart';
import 'package:bibliotec_s2/View/Tela_sobre.dart';
import 'package:bibliotec_s2/View/home_page_admin.dart';
import 'package:bibliotec_s2/View/lista_acervo_com_fotos.dart';
import 'package:bibliotec_s2/View/menu_opcos_admin.dart';
import 'package:bibliotec_s2/View/minha_conta.dart';
import 'package:bibliotec_s2/View/construtor_historia.dart';
import 'package:bibliotec_s2/View/nova_historia.dart';
import 'package:bibliotec_s2/arquivo%20morto/blocas002.dart';
import 'package:bibliotec_s2/arquivo%20morto/listar_acervo.dart';
 // imports firebse
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'View/interface de introdução.dart';
import 'arquivo morto/cadastro.dart';
import 'View/pages/Formularios/criar_conta.dart';
import 'View/pages/Formularios/login.dart';
 
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/TELA_INICIAL',
      routes: {
        '/login': (context) => LoginPage(), //TELA DE LOGIN
        '/criar_conta': (context) => CriarContaPage(),// CRIAR UMA CONTA
        '/FeedBlocos01': (context) => FeedBlocos01(), // OLD
        '/cadastro': (context) => CadastroPage(), // CADASTRAR HISTORIAS
        '/menu_opcoes': (context) => Painel_de_colecoes(), //MENU DE OPÇOES ADMIN
        '/NovaHistoria': (context) => NovaHistoria(),//  // CADASTRAR HISTORIAS
        '/Listar_acervo': (context) => Listar_acervo(), //LISTAR ACERVO
        '/HOME': (context) => HomePage(),// PAGINA INICIAL
        '/sobre': (context) => Tela_sobre(), // TELA SOBRE VAZIA
        '/Minha_conta': (context) => Minha_conta(), // MINHA CONTA VIZIO
        '/AcervoListview': (context) => lista_acervo_listview(), // LISTA DE CONTEUDO
        '/Intro': (context) => Introapp(), ////SPLASHSCREM COM ERRO
        '/Tijolometro': (context) => ConstrutorDEhistorias(), // FORMULARIO DE CADASTRO DE PUBLICAÇOES
        '/TELA_INICIAL': (context) => Tela_Inicial_ABERTO(), // TELA INICIAL PUBLICA
        '/POST': (context) => ViewPost(), // POSTAGEM 
      },
    ),
  );
}

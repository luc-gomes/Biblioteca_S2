 

import 'package:bibliotec_s2/View/pages/Conteudo/splash2.dart';
import 'package:bibliotec_s2/View/pages/Feeds/Tela_Resultado_Pesquisa.dart';
import 'package:bibliotec_s2/View/pages/Feeds/Tela_inicial_feed_aberto.dart';
import 'package:bibliotec_s2/View/pages/Conteudo/conteudo_publicacao.dart';
import 'package:bibliotec_s2/View/pages/Formularios/Login_animado.dart';
import 'package:bibliotec_s2/View/pages/Menus/Main_menu.dart';
import 'package:bibliotec_s2/View/pages/Menus/Tela_sobre.dart';
import 'package:bibliotec_s2/View/pages/Menus/home_page_admin.dart';
import 'package:bibliotec_s2/View/pages/Feeds/lista_acervo_com_fotos.dart';
import 'package:bibliotec_s2/View/pages/Menus/menu_opcoes_admin.dart';
import 'package:bibliotec_s2/View/pages/Menus/minha_conta.dart';
import 'package:bibliotec_s2/View/pages/Formularios/construtor_historia.dart';
import 'package:bibliotec_s2/View/pages/Formularios/nova_historia.dart';
import 'package:bibliotec_s2/arquivo%20morto/blocas002.dart';
import 'package:bibliotec_s2/arquivo%20morto/listar_acervo.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
 
import 'firebase_options.dart';
import 'arquivo morto/cadastro.dart';
import 'View/pages/Formularios/criar_conta.dart';
import 'View/pages/Formularios/login.dart';
 
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const Splash2() );

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  } catch(e) {
    print("Failed to initialize Firebase: $e");
  }

  runApp(
    GetMaterialApp(
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        ],
    theme: ThemeData(
    useMaterial3: true),
   darkTheme: ThemeData(
    useMaterial3: true,
  ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/TELA_INICIAL',
      routes: {
        '/criar_conta': (context) => CriarContaPage(),// CRIAR UMA CONTA
        '/cadastro': (context) => CadastroPage(), // CADASTRAR HISTORIAS
        '/menu_opcoes': (context) => Dashboard_adm(), //MENU DE OPÇOES ADMIN
        '/NovaHistoria': (context) => NovaHistoria(),//  // CADASTRAR HISTORIAS
        '/Listar_acervo': (context) => Listar_acervo(), //LISTAR ACERVO
        '/HOME': (context) => HomePage(),// PAGINA INICIAL
        '/sobre': (context) => Tela_sobre(), // TELA SOBRE VAZIA
        '/Minha_conta': (context) => Minha_conta(), // MINHA CONTA VIZIO
        '/AcervoListview': (context) => Lista_acervo_listview(), // LISTA DE CONTEUDO
        '/Tijolometro': (context) => ConstrutorDEhistorias(), // FORMULARIO DE CADASTRO DE PUBLICAÇOES
        '/TELA_INICIAL': (context) => Tela_Inicial_ABERTO(), // TELA INICIAL PUBLICA
        '/POST': (context) => ViewPost(), // POSTAGEM 
        '/login_improved': (context) => LoginPage_improved_animated(), 
         '/pesquisa': (context) => Feed_LIST_pesquisa(),// CRIAR UMA CONTA
        //OLD 
        '/login': (context) => LoginPage(), //TELA DE LOGIN antiga
        '/menu_opcoesold': (context) => Painel_de_colecoes(), //MENU DE OPÇOES ADMIN
        '/FeedBlocos01': (context) => FeedBlocos01(), // OLD
      },
    ),
  );
}

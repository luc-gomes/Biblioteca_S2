// ignore_for_file: camel_case_types

import 'package:bibliotec_s2/Widgets/Login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dados {
  final String txtEmail;
  final String user;

  Dados(
    this.txtEmail,
    this.user,
  );
}

class LoginPage_improved extends StatefulWidget {
  const LoginPage_improved({Key? key}) : super(key: key);

  

  @override
  _LoginPage_improved createState() => _LoginPage_improved();
}

class _LoginPage_improved extends State<LoginPage_improved> {
  final controller = Get.put(LoginController());
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade700,
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(
                color: Colors.orange.shade300,
                width: 8,
              ),
            ),
            child: Image.asset('lib/Img/Generico/logo-bs3bwide.jpg'),
          ),
          SizedBox(height: 10),
          Center(
            child: Obx(
              () {
                if (controller.googleAccount.value != null)
                  return buildProfileView();
                else
                  return buildProfileButton();
              },
            ),
          ),
        ]),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          // LOGO E NOME DO APP
          children: [
            Text(
              'Biblioteca_s3',
              style: TextStyle(
                  fontSize: 42,
                  fontStyle: FontStyle.normal,
                  color: Colors.yellow.shade700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        CircleAvatar(
            backgroundColor: Colors.deepOrange,
            backgroundImage:
                Image.network(controller.googleAccount.value?.photoUrl ?? ' ')
                    .image,
            radius: 150),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headlineSmall,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.headlineSmall,
        ),
        ActionChip(
          label: Text('Desconectar da plataforma'),
          avatar: Icon(Icons.logout),
          onPressed: () {
            controller.logout();
          },
        ),
        ActionChip(
          label: Text('Acessar Painel'),
          avatar: Icon(Icons.chevron_right),
          onPressed: () {



            Navigator.pushNamed(context, '/HOME');
          },
        )
      ],
    );
  }

//style: TextStyle(fontWeight: FontWeight.bold),
  Column buildProfileButton() {
    return Column(
      children: [
        FloatingActionButton.extended(
          onPressed: () {
            controller.login();
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          label: Text('Entrar com Google'),
          icon: Image.asset(
            'lib/Img/Generico/googlelogo.jpg',
            width: 30,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  
    
  
}

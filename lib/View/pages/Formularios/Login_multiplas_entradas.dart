
// ignore_for_file: camel_case_types

import 'package:bibliotec_s2/Widgets/Login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Dados {
  final String txtEmail;

  Dados(
    this.txtEmail,
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
        color: Color.fromARGB(255, 209, 101, 0),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
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
            TextField(
              controller: txtEmail,
              cursorColor: Colors.amber.shade300,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white),
                labelText: 'Email:',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                labelText: 'Senha',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: 'Senha:',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: Column(children: [
                SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 4.0,
                        color: Colors.yellow,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Entrar',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      login(txtEmail.text, txtSenha.text);
                    },
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 4.0,
                        color: Colors.yellow,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Cadastrar Conta',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/criar_conta');
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.all(5),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushNamed(context, '/logingoogle');
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      label: Text('Entrar com Google'),
                      icon: Image.asset(
                        'lib/Img/Generico/googlelogo.jpg',
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    )),
              ]),
            )
          ],
        ),
      ),
    );
  }

  void login(email, senha) {
    // LOGIN com o Firebase Auth
    var obj = Dados(
      txtEmail.text,
    );
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushReplacementNamed(context, '/Intro', arguments: obj);
    }).catchError((erro) {
      if (erro.code == 'user-not-found') {
        exibirMensagem('ERRO: Usuário não encontrado.');
      } else if (erro.code == 'wrong-password') {
        exibirMensagem('ERRO: Senha incorreta.');
      } else if (erro.code == 'invalid-email') {
        exibirMensagem('ERRO: Email inválido.');
      } else {
        exibirMensagem('ERRO: ${erro.message}.');
      }
    });
  }

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class LoginPage_google extends StatefulWidget {
  const LoginPage_google({Key? key}) : super(key: key);

  @override
  _LoginPage_google createState() => _LoginPage_google();
}

class _LoginPage_google extends State<LoginPage_google> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (controller.googleAccount.value == null)
              return buildProfileView();
            else
              return buildProfileButton();
          },
        ),
      ),
    );
  }

  Column buildProfileButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(backgroundColor: Colors.deepOrange ,backgroundImage: Image.network(controller.googleAccount.value?.photoUrl ??' ').image, radius: 150),
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
          avatar: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushNamed(context, '/HOME');
          },)
      ],
    );
  }

//style: TextStyle(fontWeight: FontWeight.bold),
  FloatingActionButton buildProfileView() {
    return FloatingActionButton.extended(
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
    );
  }
}

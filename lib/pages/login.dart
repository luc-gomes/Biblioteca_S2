import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dados {
  final String txtEmail;

  Dados(
    this.txtEmail,
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          //title: Text('Biblioteca_S2'),
          centerTitle: true,
          backgroundColor: Colors.green),
      backgroundColor: Colors.lightBlue,*/
      body: Container(
        color: Colors.blueAccent.shade100,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  color: Colors.lightBlueAccent.shade700,
                  width: 10,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.book, // INCONE DE CONTA CIRCULAR
                            size: 100,
                            color: Colors.orange.shade300)
                      ],
                    ),
                  ),
                  Container(
                    // Nome do aplicativo
                    child: Column(
                      // LOGO E NOME DO APP
                      children: [
                        Text(
                          'Sccapolindo',
                          style: TextStyle(
                              fontSize: 42,
                              fontStyle: FontStyle.italic,
                              color: Colors.lightBlue.shade700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                  borderSide:
                      BorderSide(color: Colors.white, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: 'Nickname:',
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
                  borderSide:
                      BorderSide(color: Colors.white, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: 'Senha:',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 5.0, color: Colors.white,),
                  primary: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Text(
                  'entrar',
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                },
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 5.0, color: Colors.white,),
                  primary: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/criar_conta');
                },
              ),
            ),
            SizedBox(height: 20),
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
      Navigator.pushReplacementNamed(context, '/HOME', arguments: obj);
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

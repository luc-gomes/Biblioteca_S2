import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
          title: Text('Café Store'),
          centerTitle: true,
          backgroundColor: Colors.brown),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 150,
              child: OutlinedButton(
                child: Text('entrar'),
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
              child: TextButton(
                child: Text('Criar conta'),
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

  //
  // LOGIN com o Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance.setPersistence(Persistence.SESSION).then((value) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha)
          .then((value) {
        Navigator.pushReplacementNamed(context, '/principal');
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
    }).catchError((erro) {
      exibirMensagem('ERRO: ${erro.message}.');
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
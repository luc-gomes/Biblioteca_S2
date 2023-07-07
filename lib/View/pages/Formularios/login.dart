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
        color: Colors.blue.shade700,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  color: Color.fromARGB(255, 243, 183, 77),
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
                          'Biblioteca_s3',
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
            SizedBox(height: 35),
            TextField(
              controller: txtEmail,
              cursorColor: Colors.white ,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white),
                labelText: 'Email:',  
                labelStyle: TextStyle(
                  color: Colors.white, //<-- SEE HERE
                 ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white, width: 4.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 4.0),
                ),
                hintText: 'Email:',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.white, //<-- SEE HERE
                 ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white, width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                hintText: 'Senha:',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 80,
              child: FloatingActionButton.extended(
          onPressed: () {
             login(txtEmail.text, txtSenha.text);
             setState(() {
                    isLoading = true;
                  });
             
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          label: Text('Entrar  '),
          icon: Icon(Icons.app_registration ),
           
          
        ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 80,
              child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/criar_conta');
            setState(() {
                    isLoading = true;
                  });
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          label: Text('Cadastrar conta'),
          icon:  Icon(Icons.app_registration ),
        
          ),
            ),
            SizedBox(height: 20),
            
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

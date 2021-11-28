import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Dados {
  final String txtEmail;

   
  Dados(this.txtEmail,);
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
      appBar: AppBar(
          //title: Text('Biblioteca_S2'),
          centerTitle: true,
          backgroundColor: Colors.green),

      backgroundColor: Colors.green.shade300,
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [

            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
              color: Colors.orange.shade300,
              width: 10,
          ),
          color: Colors.green.shade800,
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
                      ] ,
                  ),
            ),
        
            Container(
              // Nome do aplicativo
              child: Column(
                // LOGO E NOME DO APP
                children: [
                  // mainAxisAlignment: MainAxisAlignment.center,
                  Text(
                    'Biblioteca_S2',
                    style: TextStyle(
                        fontSize: 42,
                        fontStyle: FontStyle.normal,
                        color: Colors.orange.shade400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],),
            ),
            TextField(
              controller: txtEmail,
               cursorColor: Colors.amber.shade300,
               
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,
                color: Colors.orange.shade300),
                labelText: 'Nickname:',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade600, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1.0),
                      ),
                      hintText: 'Nickname:',
                      hintStyle: TextStyle(color: Colors.amberAccent.shade700),
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
                prefixIcon: Icon(Icons.lock,
                color: Colors.orange.shade300),
                labelText: 'Senha',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade600, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      hintText: 'Senha:',
                      hintStyle: TextStyle(color: Colors.amberAccent.shade700),
                    ),
                          ),
            SizedBox(height: 40),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),),
                child: Text('entrar',
                style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.yellow),
                          textAlign: TextAlign.center,),
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
                primary: Colors.green.shade700,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),),
                child: Text('Criar conta',
                style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.yellow),
                          textAlign: TextAlign.center,),
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
  //

  // LOGIN com o Firebase Auth

  //

  void login(email, senha) {
     var obj = Dados(
              
              txtEmail.text,
               
                  );


    FirebaseAuth.instance

        .signInWithEmailAndPassword(email: email, password: senha)

        .then((value) {
           
      Navigator.pushReplacementNamed(context, '/HOME',arguments: obj);
        

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


// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            child:Image.asset('lib/Img/Generico/logo-bs3bwide.jpg'),
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
            Container(child: Column(children: [
              SizedBox(height: 20),
             SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 4.0, color: Colors.yellow,), backgroundColor: Color.fromARGB(255, 255, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Column(children: [

                   Text('Entrar',
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                
                ],),
              onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);

                },
                
              ),
         ) ,
            SizedBox(height: 15),
           
             SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 4.0, color: Colors.yellow,), backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Column(children: [

                   Text('Cadastrar Conta',
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.center,
                ),
                
                ],),
              onPressed: () {
                  Navigator.pushNamed(context, '/criar_conta');
                },
                
              ),
         ) ,
            SizedBox(height: 20),
             SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 4.0, color: Colors.yellow,), backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Column(children: [

                   Text('Login com redes sociais',
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.center,
                ),
                
                ],),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
             
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 6),
              color: Colors.transparent,
            ),
            child:Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(3),
                             ), 
                            leading: Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                child: Image.asset(
                                  'lib/Img/Generico/facebooklogo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            title: new Text('facebook'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(3),
                             ),
                            leading: Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                child: Image.asset(
                                  'lib/Img/Generico/googlelogo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            title: new Text('Google'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(3),
                             ),
                            leading: Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                child: Image.asset(
                                  'lib/Img/Generico/githublogo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            title: new Text('github'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(3),
                             ),
                            leading: Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                child: Image.asset(
                                  'lib/Img/Generico/applelogo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            title: new Text('Apple'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
          );
                    });
                },
                
              ),
         ) 
            ]),)
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

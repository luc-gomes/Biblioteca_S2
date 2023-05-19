import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome  = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtNick  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Novo usuário'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900),
      backgroundColor: Colors.grey.shade300,
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
             TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,
                color: Colors.black),
                labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'email:',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 20),

            //-------------------------------------------------------------------


            TextField(
              controller: txtNick,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                color: Colors.black),
                labelText: 'Nickname',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'nome de usuario',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 20),
            
            //-------------------------------------------------------------------


            TextField(
              controller: txtNome,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                color: Colors.black),
                labelText: 'Nome',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Nome:',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 20),

            //-------------------------------------------------------------------

           
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,
                color: Colors.black),
                labelText: 'Senha',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Senha:',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,),
                    child: Text('cancelar',
                    style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                          textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                 SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,),
                    child: Text('criar',
                          style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                          textAlign: TextAlign.center,),
                    onPressed: () {
                      criarConta(
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
            exibirMensagem('Usuário criado com sucesso!');
            Navigator.pop(context);
        }).catchError((erro){
          if (erro.code == 'email-already-in-use'){
            exibirMensagem('ERRO: O email informado está em uso.');
          }else if (erro.code == 'invalid-email'){
            exibirMensagem('ERRO: Email inválido.');
          }else{
            exibirMensagem('ERRO: ${erro.message}');
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
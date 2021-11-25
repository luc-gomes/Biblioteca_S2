// ignore_for_file: camel_case_types

import 'package:bibliotec_s2/pages/login.dart';
import 'package:flutter/material.dart';

 

class Minha_conta extends StatefulWidget {
  const Minha_conta({Key? key}) : super(key: key);

  @override
  _Minha_contaState createState() => _Minha_contaState();
}

class _Minha_contaState extends State<Minha_conta> {
   

  @override
  Widget build(BuildContext context) {
     final obj = ModalRoute.of(context)!.settings.arguments as Dados;
     

    return Scaffold(
      appBar: AppBar(
          title: Text('MINHA CONTA'),
          centerTitle: true,
          backgroundColor: Colors.green),
      backgroundColor: Colors.green.shade300,
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                        Icon(
                            Icons
                                .account_circle_sharp, // INCONE DE CONTA CIRCULAR
                            size: 100,
                            color: Colors.orange.shade300)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          obj.txtEmail,
                          style: TextStyle(
                              fontSize: 42,
                              fontStyle: FontStyle.normal,
                              color: Colors.orange.shade400),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Introapp extends StatefulWidget {
  const Introapp({Key? key}) : super(key: key);

  @override
  _IntroappState createState() => _IntroappState();
}

class _IntroappState extends State<Introapp> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              // colocar imagem
              // Image.asset('lib/Img/intro/c.jpg'),
              // Image.asset('lib/Img/intro/u.jpg'),

              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        color: Colors.orange.shade300,
                        width: 80,
                      ),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          //  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 40),
                          minimumSize: Size(300, 70),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/TELA_INICIAL');
                        },
                        child: Text('Usuario')),
                  ),
//-----------------------------------------------------------------------------
                  SizedBox(width: 40, height: 80),
//-----------------------------------------------------------------------------

                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        color: Colors.orange.shade300,
                        width: 80,
                      ),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          //  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 40),
                          minimumSize: Size(300, 70),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/HOME');
                        },
                        child: Text('Administrador')),
                  ),
                  SizedBox(width: 40, height: 300)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

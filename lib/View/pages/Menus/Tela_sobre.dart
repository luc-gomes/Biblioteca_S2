// ignore: duplicate_ignore
// main.dart
// ignore_for_file: camel_case_types, duplicate_ignore
//import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: unnecessary_import
//import 'package:flutter/painting.dart';

// ignore: camel_case_types
class Tela_sobre extends StatefulWidget {
  const Tela_sobre({Key? key}) : super(key: key);

  @override
  _Tela_sobreState createState() => _Tela_sobreState();
}

class _Tela_sobreState extends State with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 200),
        title: Text('Sobre'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            // Horizontal Flipping
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(3*pi * _animation.value+0.75),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        width: 100,
                        height: 150,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          '?',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        )))
                    : Container(
                        width: 100,
                        height: 150,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Image.asset(
                          'lib/Img/Generico/Autor.jpg',
                          fit: BoxFit.cover,
                        )),
              ),
            ),
            // Vertical Flipping
            SizedBox(
              height: 30,
            ),
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0055)
                ..rotateX(3.14*pi * _animation.value*1.5),
              child: Card(
                child: _animation.value <= 0.7
                    ? Container(
                        width: 300,
                        height: 200,
                        decoration: new BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          ' demonstrar uma "plataforma" que adicione remova e edite publique e apresente historias.\n\nÉ SÓ TER A HABILIDADE.\n Aprecie com moderação.',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.yellow.shade700),
                        )))
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 255, 0, 0),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: RotatedBox(
                          quarterTurns: -2,
                          child: Image.asset(
                            'lib/Img/Generico/imagem ilustrativa marron.jpg',
                            fit: BoxFit.fitHeight ,
                          ),
                        )),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                onPressed: () {
                  if (_status == AnimationStatus.dismissed) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                child: Text('mostrar imagem'))
          ],
        ),
      ),
    );
  }
}

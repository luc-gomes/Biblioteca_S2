// ignore: duplicate_ignore
// main.dart
// ignore_for_file: camel_case_types, duplicate_ignore
//import 'package:flip_card/flip_card.dart';
 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../Widgets/Login_controller.dart';

// ignore: unnecessary_import
//import 'package:flutter/painting.dart';

// ignore: camel_case_types
class LoginPage_improved_animated extends StatefulWidget {
  const LoginPage_improved_animated({Key? key}) : super(key: key);

  @override
  _LoginPage_improved_animatedState createState() =>
      _LoginPage_improved_animatedState();
}

class _LoginPage_improved_animatedState extends State
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  final controller = Get.put(LoginController());
 

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
        backgroundColor: Colors.transparent,
       
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              // Horizontal Flipping

              // Vertical Flipping
              SizedBox(
                height: 30,
              ),
              Center(
                child: Obx(
                  () {
                  
                    if (controller.googleAccount.value != null) {
                      if (_status == AnimationStatus.dismissed) {
                        _controller.forward();
                      }
                      return buildProfileView();
                    } else
                      return buildProfileButton();
                  },
                ),
              ),
               
            ],
          ),
        ],
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          // LOGO E NOME DO APP
          children: [
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(4 * pi * _animation.value + 0.25),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        width: 300,
                        //height: 150,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                          child:
                              Image.asset('lib/Img/Generico/logo-bs3bwide.jpg'),
                        ))
                    : Container(
                        width: 300,
                        //height: 150,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            backgroundImage: Image.network(
                                    controller.googleAccount.value?.photoUrl ??
                                        ' ')
                                .image,
                            radius: 150),
                      ),
              ),
            ),
            Text(
              'Biblioteca_s3',
              style: TextStyle(
                  fontSize: 42,
                  fontStyle: FontStyle.normal,
                  color: Colors.yellow.shade700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headlineSmall,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.headlineSmall,
        ),
        ActionChip(
          backgroundColor: Colors.blue.shade200,
          label: Text('Desconectar da plataforma'),
          avatar: Icon(Icons.logout),
          onPressed: () {
            controller.logout();
          },
        ),
        ActionChip(
          label: Text('Acessar Painel'),
          backgroundColor: Colors.red.shade400,
          avatar: Icon(Icons.chevron_right),
          onPressed: () {
            if (_status == AnimationStatus.dismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
            Navigator.pushNamed(context, '/HOME');
          },
        ),
         ActionChip(
          label: Text('Retornar ao feed'),
          avatar: Icon(Icons.open_in_new),
          backgroundColor: Colors.blue.shade700,
          onPressed: () {
            if (_status == AnimationStatus.dismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
            Navigator.pushReplacementNamed(context, '/TELA_INICIAL');
          },
        )
      ],
    );
  }

//style: TextStyle(fontWeight: FontWeight.bold),
  Column buildProfileButton() {
    return Column(
      children: [
        FloatingActionButton.extended(
          onPressed: () {
            controller.login();
            _controller.reverse();
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          label: Text('Entrar com Google'),
          icon: Image.asset(
            'lib/Img/Generico/googlelogo.jpg',
            width: 30,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

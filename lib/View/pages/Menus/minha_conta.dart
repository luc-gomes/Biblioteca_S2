/* objetivo: fazer um menu de conta de usuario para mexer em opçoes de visualização e editar informaçoes pessoais da conta*/



// ignore_for_file: camel_case_types

 
import 'package:bibliotec_s2/Widgets/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Minha_conta extends StatefulWidget {
  const Minha_conta({Key? key}) : super(key: key);
  

  @override
  _Minha_contaState createState() => _Minha_contaState();
}
class _Minha_contaState extends State<Minha_conta> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (controller.googleAccount.value != null)
              return buildProfileView(); 
              
            else
              return Text('Erro');
          },
        ),
      ),
    );
  }

  Column buildProfileView () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
            
              Column(
              // LOGO E NOME DO APP
                children: [
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
              
            
            
            
        CircleAvatar(backgroundColor: Colors.deepOrange ,backgroundImage: Image.network(controller.googleAccount.value?.photoUrl ??' ').image, radius: 150),
        Text('Seu nome:',
          style: Get.textTheme.displayMedium,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headlineMedium,
        ),
        Text('Email?',
          style: Get.textTheme.displaySmall,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.labelMedium,
        ),
        
       
        ActionChip(

          label: Text('Desconectar da plataforma'),
          avatar: Icon(Icons.logout),
          onPressed: () {
            controller.logout();
          },

          
        ),
 
      ],
    );
  }
}

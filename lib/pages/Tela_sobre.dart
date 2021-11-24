
import 'package:flutter/material.dart';
//import 'package:biblioteca_p1/Telas/signin_up.dart' show  Dados;
// 
// ignore: camel_case_types
class Tela_sobre_stl extends StatelessWidget {
  const Tela_sobre_stl({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // recuperar dados da classe DADOS
    //
    //

   // final obj = ModalRoute.of(context)!.settings.arguments as Dados ;
//
//
//
    return Scaffold(appBar: AppBar(
      title:Text('Sobre:'),),
      body: Container( 
      padding: EdgeInsets.all(30),
    
      //decoração
      decoration: BoxDecoration(
        border:  Border.all(
          color:  Colors.orange.shade200,
          width: 25,
        ),
      color: Colors.blue[200],
      ),
      width: MediaQuery.of(context).size.width *0.99,
      height: 700,
        
      child: Column(
        children: [
          Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Sobre o aplicativo',
            style: TextStyle(
            fontSize: 42,
            fontStyle: FontStyle.normal,
            color: Colors.amber.shade800,
       
         ),
        ),
      ],
    ), 

     ),
     Container(
        margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
          decoration: BoxDecoration(
          border:  Border.all(
          color:  Colors.orange.shade200,
          width: 5,
          ),
        ),
        width: MediaQuery.of(context).size.width *0.70,
        //height: 700,
        child: Column(children: [
        // colocar imagem
        Image.asset('lib/img/lucas_gomes_da_silva.jpg'
        ),
       
      Container(
        width: 250,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lucas gomes da silva',
              style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
          ),
        ),


         ],
       ),),
      Container(
           padding: EdgeInsets.all(30),
           //decoração
          decoration: BoxDecoration(
          border:  Border.all(
          color:  Colors.amber.shade900,
          //width: 10,
        ),
      color: Colors.blue[400],
      ),
      width: MediaQuery.of(context).size.width *0.99,
      child: Column(children: [
      
          Text('Prototipo base para plataforma de entretenimento multimidia.',
              style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
               ),
              ),
            ],
          ), 
        ),
      /*
      Container(

           padding: EdgeInsets.all(30),
             //decoração
            decoration: BoxDecoration(
              border:  Border.all(
              color:  Colors.amber.shade900,
              width: 10,
            ),
            color: Colors.blue[400],
            ),
            width: MediaQuery.of(context).size.width *0.99,
            child: Column(children: [
            Text('Nome de usuario CADASTRADO'),
            Text(obj.nome),
            Text('email de usuario CADASTRADO'),
            Text( obj.email),
            Text('Nome do usuario'),
        //    Text(obj.nickname),
         
        ],
      ),
    ),

*/
  ],),
 ),
  ],),
  ),
);    
}
}
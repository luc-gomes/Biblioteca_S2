import 'package:flutter/material.dart';

class WidgetHistoria extends StatelessWidget {

  final String capa;
  final String titulo;

  const WidgetHistoria(this.capa, this.titulo,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  
      //margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: EdgeInsets.all(30),
      //decoração
      decoration: BoxDecoration(
        border:  Border.all(
          color:  Colors.yellow.shade700,
          width: 25,
        ),
      color: Colors.blue[200],
      ),
      width: MediaQuery.of(context).size.width *0.99,
      height: 700,
      child: Column(children: [
        // colocar imagem
        Image.asset(capa),
       
       Container(
         width: 310,
         child: Column(
           
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           // 
            Text(this.titulo,
              style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
          ),
        ),


         ],
       ),),
       
      ],
      ),

    );
  }
}
 
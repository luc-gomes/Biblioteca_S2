import 'package:flutter/material.dart';

class WidgetHistoria extends StatelessWidget {

  final String capa;
  final String titulo;

  const WidgetHistoria(this.capa, this.titulo,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
         
         padding: EdgeInsets.all(30),

         decoration: BoxDecoration(
            color:  Colors.yellow.shade700,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
          ),
                   
      
      ),
      width: MediaQuery.of(context).size.width *0.80,
      height: 600,
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
 
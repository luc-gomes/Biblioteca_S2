import 'package:flutter/material.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: 
       Container(color: Colors.brown.withOpacity(0.8),
         child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Image.asset(
                              'lib/Img/Generico/logobs3.jpg',
                              fit: BoxFit.cover ,
                            ),
            ]
          ),
             ),
       ),
    );
  }
}

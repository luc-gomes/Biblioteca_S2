
import 'package:bibliotec_s2/Widgets/historia.dart';
import 'package:flutter/material.dart';



class FeedBlocos01 extends StatefulWidget {
  const FeedBlocos01({Key? key}) : super(key: key);

  @override
  _FeedBlocos01State createState() => _FeedBlocos01State();
}

class _FeedBlocos01State extends State<FeedBlocos01> {
  @override
  Widget build(BuildContext context) {
    // dados da classe obj que esta no arquivo sigin_up.dart

  //  final obj = ModalRoute.of(context)!.settings.arguments as Dados;

    //visibilidade do conteiner

   // bool _isVisible = true;

   /* void showToast() {
      setState(() {
        _isVisible = !_isVisible;
      });
    }
*/
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           /* Container(
              padding: EdgeInsets.all(30),
              //decoração
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.amber.shade900,
                  width: 10,
                ),
                color: Colors.blue[400],
              ),
              width: MediaQuery.of(context).size.width * 0.99,
              child: Visibility(
                visible: _isVisible,
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'Seja bem vindo:',
                          style: TextStyle(
                            fontSize: 43,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          obj.nome,
                          style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          'Confirme seu email:',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          obj.email,
                          style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        /*  Text('Nome do usuario'),
                       Text(obj.nickname),*/

                       ElevatedButton(
                    child: Text('Confirmar'),
                    onPressed: () { 

                      //ocultar card e cntainder de forma a sumir com ele da tela
                      showToast();
                      _isVisible = false;
                     },),
                      ],

                    ),
                     color: Colors.blue[400],
                  ),
                ),
              ),
            ),
           
           */
            Container(
              child: Row(
                // titulo da pagina principal
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Acervo:',
                    style: TextStyle(
                      fontSize: 42,
                      fontStyle: FontStyle.normal,
                      color: Colors.amber.shade800,
                    ),
                  ),
                ],
              ),
            ),
            WidgetHistoria('lib/Img/dicionario_aurelio.jpg', 'Dicionario Aurélio'),
            WidgetHistoria('lib/Img/dona_flor.jpg', 'Dona flor e seus dois maridos'),
            WidgetHistoria('lib/Img/Bras_cubas.jpg', 'Memorias postomas de Bras Cubas'),
            WidgetHistoria('lib/img/dom_casmurro.jpg', 'Dom Casmurro'),
          ],
        ),
      ),
    );
  }
}
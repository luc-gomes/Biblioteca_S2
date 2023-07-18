// ignore_for_file: non_constant_identifier_names, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class NovaHistoria extends StatefulWidget {
  const NovaHistoria({ Key? key }) : super(key: key);
  @override
  State<NovaHistoria> createState() => _NovaHistoriaState();
}
class _NovaHistoriaState extends State<NovaHistoria> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txtAutor = TextEditingController();
  var txtSinopse = TextEditingController();
  var  isChecked = true;
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('Historias')
        .doc(id)
        .get()
        .then((doc) {

      txtTitulo.text = doc.get('titulo');
      txtSubtitulo.text = doc.get('subtitulo');
      txtAutor.text = doc.get('autor');
      txtSinopse.text = doc.get('sinopse');
       isChecked = doc.get('visibilidade');
    
    });
  }
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;
    if (id != null) {
      if (txtTitulo.text.isEmpty &&
          txtSubtitulo.text.isEmpty &&
          txtAutor.text.isEmpty &&
          txtSinopse.text.isEmpty) {
        getDocumentById(id);
      }
    }
    Future<void> SalvarDocumento() async {
      if (id == null) {
        FirebaseFirestore.instance.collection('Historias').add({
          'autor': txtAutor.text,
          'sinopse': txtSinopse.text,
          'subtitulo': txtSubtitulo.text,
          'titulo': txtTitulo.text,
          'visibilidade': isChecked,
          
        });
      } else {
        FirebaseFirestore.instance
            .collection('Historias')
            .doc(id.toString())
            .set({
          'autor': txtAutor.text,
          'sinopse': txtSinopse.text,
          'subtitulo': txtSubtitulo.text,
          'titulo': txtTitulo.text,
          'visibilidade': isChecked,
          
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Operação realizada com sucesso!'),
          duration: Duration(seconds: 3),elevation: BorderSide.strokeAlignCenter,
        ),
      );
      Navigator.pop(context);
    }
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        
        // ignore: unnecessary_new
        title: new Text(
          "Edição",
          style: TextStyle(color: Colors.red,),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: ()   {
              Navigator.pop(context);

            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Row(children: [
            Text('Vidibilidade'),
            Checkbox(
            checkColor: Colors.white,
           // fillColor: Colors.amber,
            value: isChecked,
            onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });}),

          ],),
          TextField(
            // TITULO
            controller: txtTitulo,
            style: TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
              labelText: 'Titulo',
              labelStyle: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            // SUBTITULO
            controller: txtSubtitulo,
            style: TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
              labelText: 'Subtitulo',
              labelStyle: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
          const SizedBox(height: 50),
          TextField(
            // AUTOR
            controller: txtAutor,
            style: TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
              labelText: 'Autor',
              labelStyle: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
          const SizedBox(height: 50),
          TextField(
            // SINOPSE
            maxLines: 25,
            maxLength: 5000,
            controller: txtSinopse,
            style: TextStyle(color: Colors.red.shade900, fontSize: 20),
            decoration: InputDecoration(
              labelText: 'Digite aqui:',
              labelStyle: TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ),
          const SizedBox(height: 120),
         /* Row(
            // LINHA COM BOTOES DE AÇÃO
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // BOTOES DE AÇÃO
                padding: const EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton(
                  //BTN SALVAR
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    SalvarDocumento();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton(
                  //BTN CANCELAR
                  child: const Text(
                    'cancelar',
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),*/
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          SalvarDocumento();
          // Add your onPressed code here!
        },
        label: const Text('Salvar Publicação'),
        icon: const Icon(Icons.save_as_rounded),
        backgroundColor: Colors.red,
      ),
    );
  }
}
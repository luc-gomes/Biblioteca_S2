// ignore_for_file: deprecated_member_use, camel_case_types, non_constant_identifier_names

//import 'package:get/get.dart';
//import '../../../Widgets/Datamodel.dart';
//https://www.youtube.com/watch?v=S-8v9nOCUfw
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

class Feed_pesquisa extends StatefulWidget {
  const Feed_pesquisa({Key? key}) : super(key: key);

  @override
  State<Feed_pesquisa> createState() => _Feed_pesquisaState();
}

class _Feed_pesquisaState extends State<Feed_pesquisa> {
  var data;
  List _allResults = [];
  List _Result_list = [];
  final TextEditingController _searchcontroller = TextEditingController();

  @override
  void initState() {

    _searchcontroller.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchcontroller.text);
    SearchResultList();
  }

  SearchResultList() {
    var showResults = [];

    if (_searchcontroller.text != "") {
      for (var historiaSnapshot in _allResults) {
        var titulo = historiaSnapshot['titulo'].toString().toLowerCase();
        if (titulo.contains(_searchcontroller.text.toLowerCase())) {
          showResults.add(historiaSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    setState(() {
      _allResults = showResults;
    });
  }

  getHistoriastream() async {
    data = await FirebaseFirestore.instance
        .collection('Historias')
        .orderBy('titulo')
        .get();

    setState(() {
      _allResults = data.docs;
    });
    SearchResultList();
  }

    @override
  void dispose() {
    _searchcontroller.removeListener(_onSearchChanged);
    _searchcontroller.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getHistoriastream();
    super.didChangeDependencies();
  }

  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(
          color: Colors.orange.shade300,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            //TITULO

            child: Text(
              titulo,
              style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 236, 205, 64),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            //SUBTITULO
            child: Text(
              subtitulo,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 236, 205, 64),
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            // imagem
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(
                color: Colors.orange.shade300,
                width: 18,
              ),
            ),
            child:
                Image.asset('lib/Img/Generico/imagem ilustrativa marron.jpg'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 202, 77, 61),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/POST',
                        arguments: ({
                          "uid": item.id,
                          "titulo_pub": titulo,
                          "autor_pub": item.data()['autor'],
                          "subtitulo_pub": item.data()['subtitulo'],
                          "texto": item.data()['sinopse']
                        }));
                  },
                  child: Text('Continuar lendo'))
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pesquisa',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent.shade200,
            title: CupertinoSearchTextField(
              controller: _searchcontroller,
            )),
        body: ListView.builder(
            itemCount: _Result_list.length,

            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_Result_list[index]['titulo'],),
                subtitle: Text(_Result_list[index]['subtitulo'],),
                // trailing: Text(_Result_list[index]['autor'],),
              );
            }),
      ),
    );
  }
}

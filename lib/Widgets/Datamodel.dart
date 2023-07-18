 import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? titulo;
  final String? subtitulo;
  final String? autor;
  //final String? tool;

  DataModel({this.titulo, this.subtitulo, this.autor });

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
          titulo: dataMap['name'],
          subtitulo: dataMap['developer'],
          autor: dataMap['framework']);
         // tool: dataMap['tool']);
    }).toList();
  }
}
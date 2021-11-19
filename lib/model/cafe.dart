
class Cafe{

  int id;
  String title;
  String description;
  String ingredients;

  Cafe(this.id,this.title,this.description,this.ingredients);
  
  //Converter a resposta da API em um objeto da classe Cafe
  Cafe.fromJson(Map json):
    id = json['id'],
    title = json['title'],
    description = json['description'],
    ingredients = json['ingredients'].toString();
}

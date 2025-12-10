class Fruits{

  final int id;
  final String name;

  Fruits({required this.id,required this.name});

  factory Fruits.fromjson(Map<String,dynamic>json){
    return Fruits(
        id: json['id'],
        name: json['name']);
  }
  Map<String,dynamic>json(){
    return {
      'id':id ,
      'name':name
    };
  }
}
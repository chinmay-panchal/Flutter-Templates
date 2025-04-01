class data {
  String? message;
  List<CategoryCard>? bugr;
  List<CategoryCard>? piz;
  List<CategoryCard>? sand;

  data({this.message,this.piz,this.bugr,this.sand}){

  }
}

class CategoryCard {
  String path = "";
  String name = "";
  String starting = "Starting";
  int price = 0;

  CategoryCard(
      {required String path, required String name, required int price}) {
    this.path = path;
    this.name = name;
    this.price = price;
  }
}

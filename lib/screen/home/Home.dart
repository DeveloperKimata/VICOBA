class Home {
  String? title;
  String? img;

  Home({this.title, this.img});

  Home.fromJson(Map<String,dynamic>json){
    title = json['title'];
    img = json['img'];
  }
}

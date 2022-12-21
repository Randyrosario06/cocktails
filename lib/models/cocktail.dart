class Cocktail {
  String? drinkName;
  String? drinkThumb;
  String? drinkId;

  Cocktail({this.drinkName, this.drinkThumb, this.drinkId});

  Cocktail.fromJson(Map<String, dynamic> json) {
    drinkName = json['strDrink'];
    drinkThumb = json['strDrinkThumb'];
    drinkId = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['strDrink'] = this.drinkName;
    data['strDrinkThumb'] = this.drinkThumb;
    data['idDrink'] = this.drinkId;
    return data;
  }
}

import 'package:cocktail_cookbook/models/cocktail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'models/cocktail_detail.dart';

Future<List<Cocktail>> getCocktails(category) async {
  var url = 'thecocktaildb.com';
  var urlExtension = '/api/json/v1/1/filter.php';
  final Map<String, String> queryParameters = <String, String>{
    'c': category,
  };
  final api = Uri.https(url, urlExtension, queryParameters);
  List<Cocktail> cocktails = [];
  var response = await http.get(api);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    cocktails = jsonResponse['drinks']
        .map((movieFileJson) => Cocktail.fromJson(movieFileJson))
        .toList()
        .cast<Cocktail>();
  }
  return cocktails;
}

Future<CocktailDetail>? getCocktailDetails(cocktailId) async {
  var url = 'thecocktaildb.com';
  var urlExtension = '/api/json/v1/1/lookup.php';
  final Map<String, String> queryParameters = <String, String>{
    'i': cocktailId,
  };
  final api = Uri.https(url, urlExtension, queryParameters);
  List<CocktailDetail> cocktail;
  var response = await http.get(api);
  var jsonResponse = convert.jsonDecode(response.body);
  cocktail = jsonResponse['drinks']
      .map((movieFileJson) => CocktailDetail.fromJson(movieFileJson))
      .toList()
      .cast<CocktailDetail>();
  return cocktail[0];
}

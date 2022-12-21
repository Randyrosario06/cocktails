import 'package:cocktail_cookbook/models/cocktail_detail.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class CocktailDetails extends StatefulWidget {
  final String cocktail;
  const CocktailDetails({Key? key, required this.cocktail}) : super(key: key);

  @override
  State<CocktailDetails> createState() => _CocktailDetailState();
}

class _CocktailDetailState extends State<CocktailDetails> {
  CocktailDetail? _cocktail;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    _cocktail = await getCocktailDetails(widget.cocktail);
    Future.delayed(Duration.zero).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(15, 26, 32, 1),
        appBar: AppBar(
            title: const Text('Details'),
            backgroundColor: const Color.fromRGBO(15, 26, 32, 1)),
        body: _cocktail == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(child: cocktailDetail(_cocktail!)));
  }

  Widget cocktailDetail(CocktailDetail cocktail) {
    var ingredientsTextStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          Center(
              child: SizedBox(
                  height: 200, child: Image.network(cocktail.strDrinkThumb!))),
          const SizedBox(
            height: 30,
          ),
          Text(
            cocktail.strDrink!,
            style: const TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ]),
        const Divider(
          thickness: 1.5,
        ),
        const Text('Ingredients',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        const SizedBox(
          height: 20,
        ),
        Text(
          cocktail.strIngredient1 ?? '',
          style: ingredientsTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cocktail.strIngredient2 ?? '',
          style: ingredientsTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cocktail.strIngredient3 ?? '',
          style: ingredientsTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cocktail.strIngredient4 ?? '',
          style: ingredientsTextStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('Instructions',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Text(
            cocktail.strInstructions!,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

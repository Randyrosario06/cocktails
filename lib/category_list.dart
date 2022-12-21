import 'package:cocktail_cookbook/cocktail_detail.dart';
import 'package:cocktail_cookbook/models/cocktail.dart';
import 'package:cocktail_cookbook/models/cocktail_detail.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class CategoryList extends StatefulWidget {
  final String category;
  const CategoryList({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late List<Cocktail>? _categoryList = [];
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  _getData() async {
    _categoryList = await getCocktails(widget.category);
    Future.delayed(Duration.zero).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(15, 26, 32, 1),
        appBar: AppBar(
            title: Text(widget.category),
            backgroundColor: const Color.fromRGBO(15, 26, 32, 1)),
        body: _categoryList == null || _categoryList!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: cocktails(_categoryList!),
                  ),
                ),
              ));
  }

  List<Widget> cocktails(List<Cocktail> categoryList) {
    List<Widget> list = [];
    for (var item in categoryList) {
      list.add(cocktailItem(item));
    }
    return list;
  }

  Widget cocktailItem(Cocktail cocktailDetail) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CocktailDetails(
                  cocktail: cocktailDetail.drinkId.toString(),
                )));
      },
      child: SizedBox(
        height: 208,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.network(cocktailDetail.drinkThumb!)),
            const SizedBox(
              height: 10,
            ),
            Text(
              cocktailDetail.drinkName!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

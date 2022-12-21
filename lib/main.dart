import 'package:flutter/material.dart';

import 'category_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cocktail CookBook',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 26, 32, 1),
      appBar: AppBar(
          title: const Text('Cocktail CookBook'),
          backgroundColor: const Color.fromRGBO(15, 26, 32, 1)),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 50),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            cocktailCategory(Colors.yellowAccent, Icons.local_bar_outlined,
                Colors.amber, 'Cocktails'),
            cocktailCategory(Colors.yellowAccent, Icons.sports_bar_outlined,
                Colors.amber, 'Beers'),
            cocktailCategory(Colors.yellowAccent, Icons.liquor_outlined,
                Colors.amber, 'Shots'),
            cocktailCategory(Colors.yellowAccent, Icons.celebration_outlined,
                Colors.amber, 'Party Drinks'),
            cocktailCategory(Colors.yellowAccent, Icons.nightlife_outlined,
                Colors.amber, 'Shakes'),
            cocktailCategory(Colors.yellowAccent, Icons.wine_bar_outlined,
                Colors.amber, 'Soft Drinks'),
          ],
        ),
      ),
    );
  }

  Widget cocktailCategory(color, icon, iconColor, text) {
    var category = '';

    switch (text) {
      case 'Cocktails':
        category = 'Cocktail';
        break;
      case 'Beers':
        category = 'Beer';
        break;
      case 'Shots':
        category = 'Shot';
        break;
      case 'Party Drinks':
        category = 'Punch / Party Drink';
        break;
      case 'Shakes':
        category = 'Shake';
        break;
      case 'Soft Drinks':
        category = 'Soft Drink';
        break;

      default:
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryList(
                  category: category,
                )));
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(162, 103, 105, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: iconColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}

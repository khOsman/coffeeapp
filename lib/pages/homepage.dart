import 'package:coffeeapp/constants/image_urls.dart';
import 'package:coffeeapp/widgets/coffee_tile.dart';
import 'package:coffeeapp/widgets/coffee_type.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Latte', true],
    ['Cappucino', false],
    ['Espresso', false],
    ['Americano', false],
    ['Cold Latte', false],
    ['Frapple', false],
    ['Ice Tea', false],
  ];

  void coffeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        i == index ? coffeeType[i][1] = true : coffeeType[i][1] = false;
      }
    });
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu_book_rounded),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person_outline),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black54,
        backgroundColor: Colors.black54,
        buttonBackgroundColor: Color.fromARGB(255, 231, 108, 63),
        key: _bottomNavigationKey,
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.notifications),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: GoogleFonts.bebasNeue(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // Coffee type
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: ((context, index) {
                  return CoffeeType(
                      coffeename: coffeeType[index][0],
                      selected: coffeeType[index][1],
                      onTap: () {
                        coffeTypeSelected(index);
                      });
                })),
          ),

          // Horizontal listvoew of coffee tiles
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    imageUrl: ImageURL.coffeeUrl1,
                    title: "Latte",
                    subTitle: "With hazelnut",
                    price: 4.00,
                  ),
                  CoffeeTile(
                    imageUrl: ImageURL.coffeeUrl2,
                    title: "Cappacino",
                    subTitle: "With Cream",
                    price: 3.50,
                  ),
                  CoffeeTile(
                    imageUrl: ImageURL.coffee1Url3,
                    title: "Espresso",
                    subTitle: "Single shot",
                    price: 2.00,
                  ),
                  CoffeeTile(
                    imageUrl: ImageURL.coffee1Url4,
                    title: "Americano",
                    subTitle: "Double Shot",
                    price: 3.00,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

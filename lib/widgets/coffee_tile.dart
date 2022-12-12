import 'package:coffeeapp/constants/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final num price;

  const CoffeeTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageUrl),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    title,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Desc
                  Text(
                    subTitle,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // price tag & add button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$' + price.toString(),
                    style: GoogleFonts.bebasNeue(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 108, 63),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeType extends StatelessWidget {
  final String coffeename;
  final bool selected;
  final VoidCallback onTap;

  const CoffeeType(
      {super.key,
      required this.coffeename,
      this.selected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          coffeename,
          style: GoogleFonts.bebasNeue(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:
                selected ? Color.fromARGB(255, 231, 108, 63) : Colors.white24,
          ),
        ),
      ),
    );
  }
}

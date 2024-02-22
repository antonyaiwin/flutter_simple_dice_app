import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  bool diceRolling = false;
  int? number;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Rolling'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: diceRolling
                  ? null
                  : () async {
                      diceRolling = true;
                      for (var i = 0; i < 10; i++) {
                        setState(() {
                          number = Random().nextInt(6) + 1;
                          angle = Random().nextDouble() * 360;
                        });
                        await Future.delayed(const Duration(milliseconds: 100));
                      }
                      setState(() {
                        diceRolling = false;
                      });
                    },
              child: Transform.rotate(
                angle: angle,
                child: InkWell(
                  child: Image.asset(
                    number == null
                        ? 'assets/images/button.png'
                        : 'assets/images/d$number.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
            Text(
              number == null
                  ? 'Click Start to begin.'
                  : 'Click on Dice to roll again',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

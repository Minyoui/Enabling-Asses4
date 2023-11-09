import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with TickerProviderStateMixin {
  int rightDice = Random().nextInt(6) + 1;
  int leftDice = Random().nextInt(6) + 1;
  double turns = 0.0;
  int rotationSpeed = 8;
  int rotationDuration = 3000; // in miliseconds

  bool isJumpscare = false;

  void getRandomDiceValues() {
    setState(() {
      rightDice = Random().nextInt(6) + 1;
      leftDice = Random().nextInt(6) + 1;

      isJumpscare = leftDice == rightDice;
    });
  }

  void rotateDice() {
    setState(() {
      turns += rotationSpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isJumpscare
                ? 'images/8bit-pixel5.gif'
                : 'images/8bit-pixel4.gif'),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('EA4: Stateless and Stateful Widget'),
            backgroundColor: Colors.black45,
          ),
          backgroundColor: Colors.black12,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: AnimatedRotation(
                              turns: turns,
                              curve: Curves.elasticInOut,
                              duration:
                                  Duration(milliseconds: rotationDuration),
                              onEnd: getRandomDiceValues,
                              child: TextButton(
                                onPressed: rotateDice,
                                child: Image.asset('images/dice$leftDice.png'),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: AnimatedRotation(
                              turns: turns,
                              curve: Curves.elasticInOut,
                              duration:
                                  Duration(milliseconds: rotationDuration),
                              onEnd: getRandomDiceValues,
                              child: TextButton(
                                onPressed: rotateDice,
                                child: Image.asset('images/dice$rightDice.png'),
                              ),
                            )),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  Text(
                    isJumpscare
                        ? 'YOUR FAITH IS SEALED'
                        : 'Roll the dice and thy choose your faith',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class _DicePageState extends State<DicePage> {
  int rightDice = Random().nextInt(6) + 1;
  int leftDice = Random().nextInt(6) + 1;

  void getRandomDiceValues() {
    setState(() {
      rightDice = Random().nextInt(6) + 1;
      leftDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('EA4: Stateless and Stateful Widget'),
            backgroundColor: Colors.black45,
          ),
          backgroundColor: Colors.red,
          body: SafeArea(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            getRandomDiceValues();
                            print('left is clicked');
                          },
                          child: Image.asset('images/dice$leftDice.png')),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            getRandomDiceValues();
                            print('right is clicked');
                          },
                          child: Image.asset('images/dice$rightDice.png')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

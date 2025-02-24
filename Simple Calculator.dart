import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  // Function to perform calculation
  void calculate(String operator) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    double result = 0;

    // Perform the operation based on the button clicked
    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          result = 0;
        }
        break;
    }

    // Update the result in the third text field
    setState(() {
      resultController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter First Number'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Second Number'),
            ),
            TextField(
              controller: resultController,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Result'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculate('+');
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate('-');
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate('*');
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate('/');
                  },
                  child: const Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

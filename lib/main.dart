import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  double result = 0;

  void calculate(String operation) {
    setState(() {
      switch (operation) {
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
          result = num2 != 0 ? num1 / num2 : 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.number,
              onChanged: (value) => num1 = double.tryParse(value) ?? 0,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.number,
              onChanged: (value) => num2 = double.tryParse(value) ?? 0,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => calculate('+'), child: const Text('+')),
                ElevatedButton(
                    onPressed: () => calculate('-'), child: const Text('-')),
                ElevatedButton(
                    onPressed: () => calculate('*'), child: const Text('*')),
                ElevatedButton(
                    onPressed: () => calculate('/'), child: const Text('/')),
              ],
            ),
            const SizedBox(height: 20),
            Text('Resultado: $result', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

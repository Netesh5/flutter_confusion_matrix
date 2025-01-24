import 'package:flutter/material.dart';
import 'package:flutter_confusion_matrix/flutter_confusion_matrix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confusion Matrix Heatmap'),
      ),
      body: Column(
        children: [
          ConfusionMatrix(
            xAxis: const ['A', 'B', 'C'],
            yAxis: const ['A', 'B', 'C'],
            data: const [
              [100, 33, 5],
              [20, 150, 400],
              [10, 30, 100],
            ],
            color: Colors.green,
            cellWidth: 50,
            cellHeight: 50,
            size: const Size(600, 600),
            backgroundOpacity: 3,
            xAxisStyle: const TextStyle(color: Colors.black, fontSize: 16),
            yAxisStyle: const TextStyle(color: Colors.black, fontSize: 16),
            reverseColor: true,
          ),
        ],
      ),
    );
  }
}

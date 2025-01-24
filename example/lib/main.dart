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
      body: const Column(
        children: [
          ConfusionMatrix(
            xAxis: ['A', 'B', 'C'],
            yAxis: ['A', 'B', 'C'],
            data: [
              [10, 5, 3],
              [2, 15, 4],
              [1, 3, 20],
            ],
            color: Colors.blue,
            cellWidth: 50,
            cellHeight: 50,
            backgroundOpacity: 3,
            xAxisStyle: TextStyle(color: Colors.black, fontSize: 16),
            yAxisStyle: TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}

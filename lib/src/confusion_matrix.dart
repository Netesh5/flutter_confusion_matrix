import 'package:flutter/material.dart';
import 'package:flutter_confusion_matrix/flutter_confusion_matrix.dart';

class ConfusionMatrix extends StatelessWidget {
  const ConfusionMatrix({
    super.key,
    required this.xAxis,
    required this.yAxis,
    required this.data,
    required this.color,
    required this.cellHeight,
    required this.cellWidth,
    this.size,
    this.backgroundOpacity = 3,
  });
  final Size? size;

  /// The labels for the X-axis (columns).
  final List<String> xAxis;

  /// The labels for the Y-axis (rows).
  final List<String> yAxis;

  /// A 2D list representing the confusion matrix data (rows and columns).
  final List<List<num>> data;

  /// The base color for the heatmap cells.
  final Color color;

  /// The width of each individual cell in the heatmap.
  final double cellWidth;

  /// The height of each individual cell in the heatmap.
  final double cellHeight;

  /// The opacity factor used to adjust the base color for the background.
  final num backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size ?? const Size(300, 300),
      painter: ConfusionMatrixPainter(
        xAxis: xAxis,
        yAxis: yAxis,
        data: data,
        color: color,
        cellWidth: cellWidth,
        cellHeight: cellHeight,
        backgroundOpacity: backgroundOpacity,
      ),
    );
  }
}

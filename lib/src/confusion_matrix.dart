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
    this.xAxisStyle,
    this.yAxisStyle,
    this.reverseColor = false,
  })  : assert(xAxis.length == data.length && yAxis.length == data.length,
            'The length of the X-axis and Y-axis labels must match the length of the data matrix.'),
        assert(xAxis.length == yAxis.length,
            'The length of the X-axis and Y-axis labels must match.'),
        assert(backgroundOpacity != 0, 'backgroundOpacity should not be zero');
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

  /// The style for the X-axis labels.

  final TextStyle? xAxisStyle;

  /// The style for the Y-axis labels.
  final TextStyle? yAxisStyle;

  /// A flag to reverse the color gradient of the heatmap.

  final bool reverseColor;

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
        xAxisStyle: xAxisStyle,
        yAxisStyle: yAxisStyle,
        reverseColor: reverseColor,
      ),
    );
  }
}

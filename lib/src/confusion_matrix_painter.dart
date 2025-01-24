import 'dart:math';

import 'package:flutter/material.dart';

/// A custom painter class to render a confusion matrix heatmap.
/// This class is used to draw the cells, dividers, labels, and dynamically calculate
/// the background color of each cell based on the given data.
class ConfusionMatrixPainter extends CustomPainter {
  /// The labels for the X-axis (columns).
  final List<String> xAxis;

  /// The labels for the Y-axis (rows).
  final List<String> yAxis;

  /// The style for the X-axis labels.

  final TextStyle? xAxisStyle;

  /// The style for the Y-axis labels.
  final TextStyle? yAxisStyle;

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

  /// A flag to reverse the color gradient of the heatmap.
  final bool reverseColor;

  /// The color of the dividers between the cells.
  final Color dividerColor;

  ConfusionMatrixPainter({
    required this.xAxis,
    required this.yAxis,
    required this.data,
    required this.color,
    required this.cellWidth,
    required this.cellHeight,
    this.backgroundOpacity = 3, // Default background opacity adjustment factor.
    this.xAxisStyle,
    this.yAxisStyle,
    this.reverseColor = false,
    this.dividerColor = Colors.white,
  });

  /// The main method responsible for rendering the heatmap onto the canvas.
  @override
  void paint(Canvas canvas, Size size) {
    // Iterate through each cell in the matrix to draw rectangles and display data.
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        // Define the rectangle area for the current cell.
        final Rect rect = Rect.fromLTWH(
          j * cellWidth,
          i * cellHeight,
          cellWidth,
          cellHeight,
        );

        // Get the cell value and dynamically calculate its color.
        num value = data[i][j];
        Color cellColor = getColor(value);

        // Paint the cell with the calculated color.
        Paint paint = Paint()..color = cellColor;
        canvas.drawRect(rect, paint);

        // Draw white dividers between the cells for better visual separation.
        final Paint dividerPaint = Paint()..color = dividerColor;
        canvas.drawLine(
          Offset((j + 1) * cellWidth, i * cellHeight),
          Offset((j + 1) * cellWidth, (i + 1) * cellHeight),
          dividerPaint,
        );
        canvas.drawLine(
          Offset(j * cellWidth, (i + 1) * cellHeight),
          Offset((j + 1) * cellWidth, (i + 1) * cellHeight),
          dividerPaint,
        );

        // Display the value in the center of the cell as text.
        final TextSpan span = TextSpan(
          text: value.toString(),
          style: const TextStyle(color: Colors.white),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        final double dx = j * cellWidth + (cellWidth - tp.width) / 2;
        final double dy = i * cellHeight + (cellHeight - tp.height) / 2;
        tp.paint(canvas, Offset(dx, dy));
      }
    }

    // Draw the X-axis labels above the heatmap.
    for (int i = 0; i < xAxis.length; i++) {
      final TextSpan span = TextSpan(
        text: xAxis[i],
        style: xAxisStyle ?? const TextStyle(color: Colors.black),
      );
      final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      final double dx = i * cellWidth + (cellWidth - tp.width) / 2;
      final double dy = -tp.height; // Position above the cells.
      tp.paint(canvas, Offset(dx, dy));
    }

    // Draw the Y-axis labels to the left of the heatmap.
    for (int j = 0; j < yAxis.length; j++) {
      final TextSpan span = TextSpan(
        text: yAxis[j],
        style: yAxisStyle ?? const TextStyle(color: Colors.black),
      );
      final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      final double dx = -tp.width - 2; // Position to the left of the cells.
      final double dy = j * cellHeight + (cellHeight - tp.height) / 2;
      tp.paint(canvas, Offset(dx, dy));
    }
  }

  /// Dynamically calculates the cell color based on the value, adjusting
  /// it between the base color and the provided color.
  Color getColor(num value) {
    List<num> result = minMax(data);
    double minVal = result[reverseColor ? 1 : 0].toDouble();
    double maxVal = result[reverseColor ? 0 : 1].toDouble();
    double ratio = (value - minVal) / (maxVal - minVal);

    // Create a lighter background color based on the provided opacity factor.
    Color baseColor = color
        .withRed(color.red ~/ backgroundOpacity)
        .withGreen(color.green ~/ backgroundOpacity)
        .withBlue(color.blue ~/ backgroundOpacity);

    // Interpolate between the adjusted base color and the main color.
    return Color.lerp(baseColor, color, ratio)!;
  }

  /// Finds the minimum and maximum values within the 2D data list.
  List<num> minMax(List<List<num>> list) {
    return list.reduce(
      (previous, current) {
        final minVal = min(previous[0], current.reduce(min));
        final maxVal = max(previous[1], current.reduce(max));
        return [minVal, maxVal];
      },
    );
  }

  /// Prevents unnecessary repaints by returning false.
  @override
  bool shouldRepaint(ConfusionMatrixPainter oldDelegate) => false;

  /// No semantic changes, so returning false.
  @override
  bool shouldRebuildSemantics(ConfusionMatrixPainter oldDelegate) => false;
}

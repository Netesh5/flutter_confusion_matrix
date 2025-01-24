# Flutter Confusion Matrix

A Flutter package for creating and visualizing **Confusion Matrices** with a customizable heatmap. This package is ideal for machine learning and data analysis applications where a visual representation of prediction accuracy is required.

---

## 🌟 Features

- Customizable **heatmap colors** and cell dimensions.
- Configurable **X-axis** and **Y-axis** labels.
- Adjustable **background opacity** for enhanced visibility.
- Customizable **divider colors** between cells.
- Support for custom **text styles** for axis labels.

---

## 🚀 Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_confusion_matrix: <latest_version>

  
### 🎨 Customization Options


| Parameter           | Type                  | Description                                         | Default Value       |
|---------------------|-----------------------|-----------------------------------------------------|---------------------|
| `xAxis`             | `List<String>`        | Labels for the X-axis (columns).                   | **Required**        |
| `yAxis`             | `List<String>`        | Labels for the Y-axis (rows).                      | **Required**        |
| `data`              | `List<List<num>>`     | 2D list representing the confusion matrix data.    | **Required**        |
| `color`             | `Color`              | Base color for the heatmap cells.                  | **Required**        |
| `cellWidth`         | `double`              | Width of each individual cell in the heatmap.      | **Required**        |
| `cellHeight`        | `double`              | Height of each individual cell in the heatmap.     | **Required**        |
| `backgroundOpacity` | `num`                 | Opacity factor for the cell background.            | `3`                 |
| `xAxisStyle`        | `TextStyle?`          | Style for the X-axis labels.                       | `null`              |
| `yAxisStyle`        | `TextStyle?`          | Style for the Y-axis labels.                       | `null`              |
| `reverseColor`      | `bool`                | Flag to reverse the color gradient of the heatmap. | `true`              |
| `padding`           | `EdgeInsetsGeometry?` | Padding around the heatmap.                        | `EdgeInsets.all(20)`|
| `dividerColor`      | `Color`               | Color of the dividers between the cells.           | `Colors.white`      |





import 'package:flutter/material.dart';

/// Extension on [Color] to provide conversion methods between hexadecimal strings and Color objects.
extension HybridHexColor on Color {
  /// Converts a hexadecimal color string to a Flutter [Color] object.
  ///
  /// The [hexString] parameter is the hexadecimal color string to convert. It
  /// must start with a '#' character, followed by either 3 or 6 hexadecimal
  /// characters representing the RGB values. If the [hexString] has 7
  /// characters, the first character after the '#' is ignored and treated as
  /// an alpha channel value.
  ///
  /// Returns a Flutter [Color] object representing the color specified by the
  /// [hexString]. If the [hexString] is not a valid hexadecimal color string,
  /// returns a default color with the RGB values of 146, 143, and 143.
  ///
  /// Example usage:
  ///   final color = HexColor.fromHex('#FF0000'); // Red
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    try {
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Color(int.parse('928F8F', radix: 16));
    }
  }

  /// Converts the current color object to a hexadecimal color string representation.
  ///
  /// The [leadingHashSign] parameter determines whether the resulting string should
  /// start with a '#' character. If set to `true` (default), the resulting string
  /// will start with a '#'. If set to `false`, the '#' will be omitted.
  ///
  /// Returns a string representing the current color object in hexadecimal format.
  /// The string will be in the format '#AARRGGBB' or 'AARRGGBB', where:
  /// - AA is the alpha channel (opacity: 00 = transparent, FF = opaque)
  /// - RR is the red channel (00 to FF)
  /// - GG is the green channel (00 to FF)
  /// - BB is the blue channel (00 to FF)
  ///
  /// All four components (alpha, red, green, blue) are always included in the output.
  ///
  /// Example usage:
  ///   final color = Color.fromARGB(128, 255, 0, 0);
  ///   final hexString = color.toHex(); // '#80FF0000'
  ///
  ///   final color = Color.fromARGB(255, 0, 255, 0);
  ///   final hexString = color.toHex(leadingHashSign: false); // 'FF00FF00'
  ///
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${(a * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${(r * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${(g * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${(b * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}';
}

/// Deprecated extension - use [HybridHexColor] instead.
@Deprecated(
    'Use HybridHexColor instead. This extension will be removed in a future version.')
extension HexColor on Color {
  /// Deprecated - use [HybridHexColor.fromHex] instead.
  @Deprecated('Use HybridHexColor.fromHex() instead')
  static Color fromHex(String hexString) => HybridHexColor.fromHex(hexString);

  /// Deprecated - use [HybridHexColor.toHex] instead.
  @Deprecated('Use color.toHex() from HybridHexColor extension instead')
  String toHexDeprecated({bool leadingHashSign = true}) =>
      toHex(leadingHashSign: leadingHashSign);
}

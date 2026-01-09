![HybridListTile Header](https://github.com/neyenRudo/hybrid-storage/blob/flutter/images/hybrid-hex-color-converter/flutter/images/hybid-hex-color-converter/hybrid_hex_color_white.png?raw=true)

# Hybrid Hex Color Converter

A useful tool for working with hexadecimal colors in Flutter. This package provides an extension called `HybridHexColor` that can be used on Color objects in Flutter.

## What's New in 0.0.4

- Fixed deprecated Color properties for better compatibility with latest Flutter versions
- Updated to use non-deprecated getters (`a`, `r`, `g`, `b` instead of `alpha`, `red`, `green`, `blue`)
- Fixed color component conversion from normalized values (0.0-1.0) to 0-255 range
- Updated tests to use `toARGB32()` instead of deprecated `.value` property
- Improved documentation and examples
- Previous `HexColor` extension is now deprecated (use `HybridHexColor` instead)

## Features

   - **fromHex(String hexString)**: Converts a hexadecimal string into a Color object. The string can be in formats like "aabbcc" or "ffaabbcc" and may include an optional "#" sign at the beginning.

   - **toHex({bool leadingHashSign = true})**: Returns the hexadecimal representation of a color in the AARRGGBB format. You can specify whether to include the "#" sign at the beginning of the hexadecimal code.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  hybrid_hex_color_converter: ^0.0.4
```

## Usage

Import the package into your Flutter file and use the `HybridHexColor` extension on Color objects to convert colors to and from hexadecimal formats easily and efficiently.








### Examples

#### Convert a hexadecimal string to a Color object:

```dart
import 'package:flutter/material.dart';
import 'package:hybrid_hex_color_converter/hybrid_hex_color_converter.dart';

void main() {
  // Convert hex strings to Color objects
  Color red = HybridHexColor.fromHex("#FF0000");
  Color green = HybridHexColor.fromHex("#4CAF50");
  Color blue = HybridHexColor.fromHex("#2196F3");

  // Works with or without the # symbol
  Color white = HybridHexColor.fromHex("ffffff");
  Color black = HybridHexColor.fromHex("#000000");

  print(red);   // Color(0xffff0000)
  print(white); // Color(0xffffffff)
}
```

#### Convert a Color object to a hexadecimal string:

```dart
import 'package:flutter/material.dart';
import 'package:hybrid_hex_color_converter/hybrid_hex_color_converter.dart';

void main() {
  // With leading hash sign (default)
  String greenHex = Colors.green.toHex();
  print(greenHex); // #FF4CAF50

  // Without leading hash sign
  String blueHex = Colors.blue.toHex(leadingHashSign: false);
  print(blueHex); // FF2196F3

  // Works with any Color object
  Color customColor = Color.fromARGB(255, 150, 100, 200);
  String customHex = customColor.toHex();
  print(customHex); // #FF9664C8
}
```

### Migration from 0.0.2

If you're upgrading from version 0.0.2, simply replace `HexColor` with `HybridHexColor` in your code:

```dart
// Old (deprecated but still works)
Color color = HexColor.fromHex("#FF0000");

// New (recommended)
Color color = HybridHexColor.fromHex("#FF0000");
```



## Contributing

Contributions are welcome! Please feel free to submit a Pull Request to the [GitHub repository](https://github.com/rudoapps/hybrid_hex_color_converter).

## Issues

If you encounter any issues, please report them on our [issue tracker](https://github.com/rudoapps/hybrid_hex_color_converter/issues).

## Author

* **Neyen Ortega Sessarego** - *Flutter Developer* - [neyen@rudo.es](neyen@rudo.es)

## Contributor

* **Pablo Suárez Pantaleón** - *Flutter Developer* - [pablosuarez@laberit.com](pablosuarez@laberit.com)

---

With ❤️ by RudoApps Flutter Team

![Rudo Apps](https://rudo.es/wp-content/uploads/logo-rudo.svg)

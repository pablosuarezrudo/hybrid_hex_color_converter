import 'package:flutter/material.dart';
import 'package:hybrid_hex_color_converter/hybrid_hex_color_converter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hybrid Hex Color Converter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hybrid Hex Color Converter'),
        ),
        body: Column(
          children: [
            Expanded(
              child: _hexColorList(),
            ),
            const Divider(),
            Expanded(
              child: _hexStringList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hexColorList() {
    final colors = getHexColors();
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
          ),
          title: Text(color.toHex()),
        );
      },
    );
  }

  Widget _hexStringList() {
    final hexStrings = getHexStringColors();
    return ListView.builder(
      itemCount: hexStrings.length,
      itemBuilder: (context, index) {
        final hexString = hexStrings[index];
        final color = HexColor.fromHex(
            hexString.startsWith('#') ? hexString : '#$hexString');
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
          ),
          title: Text(hexString),
        );
      },
    );
  }

  List<Color> getHexColors() {
    return [
      HexColor.fromHex('#F44336'),
      HexColor.fromHex('#4CAF50'),
      HexColor.fromHex('#2196F3'),
      HexColor.fromHex('#ffffff'),
      HexColor.fromHex('#000000'),
      HexColor.fromHex('#E91E63'),
    ];
  }

  List<String> getHexStringColors() {
    return [
      Colors.blue.toHex(leadingHashSign: false),
      Colors.red.toHex(leadingHashSign: false),
      Colors.purple.toHex(leadingHashSign: false),
      Colors.green.toHex(),
      Colors.orange.toHex(),
      Colors.pink.toHex(),
    ];
  }
}

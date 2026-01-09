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
        appBar: AppBar(title: const Text('Hybrid Hex Color Converter')),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                const Text(
                  'Colors from Hex Strings:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _hexColorList(),
                const Divider(),
                const Text(
                  'Hex Strings from Colors:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _hexStringList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hexColorList() {
    final colors = getHexColors();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: hexStrings.length,
      itemBuilder: (context, index) {
        final hexString = hexStrings[index];
        final color = HybridHexColor.fromHex(
            hexString.startsWith('#') ? hexString : '#$hexString');
        return ListTile(
          contentPadding: EdgeInsets.zero,
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
      HybridHexColor.fromHex('#F44336'),
      HybridHexColor.fromHex('#4CAF50'),
      HybridHexColor.fromHex('#2196F3'),
      HybridHexColor.fromHex('#ffae98'),
      HybridHexColor.fromHex('#000000'),
      HybridHexColor.fromHex('#E91E63'),
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

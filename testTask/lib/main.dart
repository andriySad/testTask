import 'dart:math';

import 'package:flutter/material.dart';

import 'const/text_constants.dart';
import 'widgets/my_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
            .copyWith(secondary: Colors.amber),
      ),
      home: const MyHomePage(title: TextConstants.appName),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color _backgroundColorPrimary;
  late Color _backgroundColorSecondary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _backgroundColorPrimary = Theme.of(context).colorScheme.primary;
    _backgroundColorSecondary = Theme.of(context).colorScheme.secondary;
  }

  void _changeBackground() {
    final int r = Random().nextInt(256);
    final int g = Random().nextInt(256);
    final int b = Random().nextInt(256);
    setState(() {
      _backgroundColorPrimary = Color.fromRGBO(r, g, b, 0.8);
      _backgroundColorSecondary = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColorPrimary,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: _backgroundColorPrimary.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: _backgroundColorSecondary,
      ),
      body: Center(
        child: MyButton(
          function: _changeBackground,
          backgroundColor: _backgroundColorSecondary,
        ),
      ),
    );
  }
}

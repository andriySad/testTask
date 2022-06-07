import 'package:flutter/material.dart';

import '../const/text_constants.dart';

class MyButton extends StatelessWidget {
  final Function function;
  final Color backgroundColor;

  const MyButton({
    Key? key,
    required this.function,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function(),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          width: 5.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          TextConstants.tapHere,
          style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: backgroundColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// title for the button
// action to be performed on button click
class AppButton extends StatelessWidget {
  final String buttonLabel;
  final Function onTap;
  const AppButton({required this.buttonLabel, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        child: Text(buttonLabel));
  }
}

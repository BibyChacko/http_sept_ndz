import 'package:flutter/material.dart';

class AppLoadErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function onButtonTap;
  final String buttonLabel;
  const AppLoadErrorWidget(
      {required this.errorMessage, required this.onButtonTap,this.buttonLabel = "Try Again!",Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMessage),
        const SizedBox(
          height: 24,
        ),
        OutlinedButton(
            onPressed: () {
              onButtonTap();
            },
            child:  Text(buttonLabel))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AppLoadErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function onReload;
  const AppLoadErrorWidget(
      {required this.errorMessage, required this.onReload, Key? key})
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
              onReload();
            },
            child: const Text("Try Again!"))
      ],
    );
  }
}

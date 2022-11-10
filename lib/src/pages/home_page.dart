import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text("Categories")),
              ElevatedButton(onPressed: (){}, child: Text("Subscriptions")),
              ElevatedButton(onPressed: (){}, child: Text("Profile"))
            ],
          )
      ),
    );
  }
}

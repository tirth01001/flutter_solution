
import 'package:flutter/material.dart';
import 'package:flutter_widget/widget/buttons/animated_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: AnimatedButton(
          width: 200,
          height: 50,
          child: Text("Button"),
        ),
      ),
    );
  }
}
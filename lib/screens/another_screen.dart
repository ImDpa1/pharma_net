import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Anotherscreen extends StatefulWidget {
  const Anotherscreen({super.key});

  @override
  State<Anotherscreen> createState() => _AnotherscreenState();
}

class _AnotherscreenState extends State<Anotherscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hey"),),
    );
  }
}
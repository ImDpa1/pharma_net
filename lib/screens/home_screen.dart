import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pharma_net/screens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello"),
      actions: [
GestureDetector(
  onTap: (){
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, 'homescreen');
  },
)
      ],),
    );
  }
}
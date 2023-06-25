// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      //   image: DecorationImage(
      //   image: AssetImage('assets/images/login.jpg'),
      //   fit: BoxFit.cover,
      // )
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  right: 35,
                  left: 35,
                ),
child: Column(children: [
  Text("Please LogIn",
  style: TextStyle(color: Colors.black,fontSize: 32),),
  SizedBox(height: 120,),
     TextFormField(
    controller: emailController,
    decoration: InputDecoration(
      hintText: "Email",
      hintStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(Icons.email),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink),
        borderRadius: BorderRadius.circular(10)
      )
    ),
  ),
   SizedBox(height: 30,),
     TextFormField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Password",
      hintStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(Icons.lock),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink),
        borderRadius: BorderRadius.circular(10)
      )
    ),
  ),
  SizedBox(height: 30,),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
        onPressed: getLoginMethodCallback(context),
       child: Text("Login"),
       ),
       CircleAvatar(
        radius: 20,
        backgroundColor: Colors.green.shade400,
        child: IconButton(color: Colors.white,
        onPressed: (){},
        icon: Icon(Icons.arrow_forward),
        ),
       )
    ],
  ),
   SizedBox(height: 30,),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(
        onPressed: (){
          Navigator.pushNamed(context, "/signup");
        },
       child: Text("Signup",
       style: TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.pink,fontSize: 16,
       ),
       ),
       ),
           TextButton(
      onPressed: (){
        Navigator.pushNamed(context, "/forgotpassword");
      },
      child: Text("Forgot Password",style: TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.pink,
        fontSize: 16),))]),
]
              ),
            ))
          ],
        ),
      ),
    );
  }
  
  void Function() getLoginMethodCallback(BuildContext context){
    return()=> loginMethod(context);
  }
  void loginMethod(BuildContext context)async
  {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    try{
     User? firebaseUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
     if(firebaseUser !=null){
      Navigator.pushNamed(context, "/homescreen");
     }
     else{
      print('Check email and password');
     }

    }on FirebaseAuthException catch(e){
      print("Error $e");
    }
  }
}

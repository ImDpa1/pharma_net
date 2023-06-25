import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      //   image: DecorationImage(
      //   image: AssetImage('assets/images/signup.jpg'),
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
  Text("Create an account",
  style: TextStyle(color: Colors.black,fontSize: 32),),
  SizedBox(height: 120,),
  TextFormField(
    controller: nameController,
    decoration: InputDecoration(
      hintText: "Name",
      hintStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(Icons.person),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink),
        borderRadius: BorderRadius.circular(10)
      )
    ),
  ),
  SizedBox(height: 30,),
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
        onPressed: getCreateAccountCallback(context),
       child: Text("Sign Up"),
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
  )
]),
              ),
            )
          ],
        ),
      ),
    );
  }
  void Function() getCreateAccountCallback(BuildContext context){
    return()=> createAccount(context);
  }

    // ignore: dead_code
    void createAccount(BuildContext context)async{
      try{
      String Name = nameController.text.trim();
      String Email = emailController.text.trim();
      String Password = passwordController.text.trim();

     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email, password: Password
      );
      FirebaseFirestore.instance.collection("Users").doc().set({
        "name": Name,
        "email": Email,
        "password": Password,
        "createdAt": DateTime.now(),
      });
      print("User account created successfully");
      Navigator.pushNamed(context, 'login');


      } on FirebaseAuthException catch(e){
      print("Error $e");}
    }
  }
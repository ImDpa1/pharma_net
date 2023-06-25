import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
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
  Text("forgot password",
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
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
        onPressed: getForgotPasswordCallback(context),
       child: Text("forgot password"),
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
]
              ),
            ))
          ],
        ),
      ),
    );
  }
  void Function() getForgotPasswordCallback(BuildContext context)
  {
    return()=> ForgotPasswordScreen(context);
  }
  void ForgotPasswordScreen(BuildContext context) async
  {
    var email = emailController.text.trim();
    try{
       FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => {
        print("Email Sent"),
        Navigator.pushNamed(context, "Login")
       });
    }on FirebaseAuthException catch(e){
      print("Error $e");
    }
  }
 
  }


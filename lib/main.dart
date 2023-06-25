import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharma_net/screens/forgot_password.dart';
import 'package:pharma_net/screens/home_screen.dart';
import 'package:pharma_net/screens/login_screen.dart';
import 'package:pharma_net/screens/signup_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   User? user;
   @override
  void initState() {
    super.initState();
   user= FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: user  != null? "homescreen":"login",
      routes: {
        "login": (context) =>LoginScreen(),
        "/signup":(context) => SignupScreen(),
        "/homescreen":(context) => HomeScreen(),
        "/forgotpassword":(context) => ForgotPasswordScreen(),
      },
    );
  }
}













































// import 'package:flutter/material.dart';
// import 'package:pharma_net/screens/login_screen.dart';
// // import 'package:pharma_net/tab_bar_view/tab_bar_view.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();

//   runApp(const MyApp());
  
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home:  SignupScreen(),
//       // home: HomeScreen(),
//       home:  LoginScreen(),
//       // home: DefaultTabView(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

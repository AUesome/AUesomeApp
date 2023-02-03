import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'dashboard.dart';
import 'main.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/appbar.png'),
                fit: BoxFit.fill
            ),

          ),
        ),

        //title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //margin: EdgeInsets.only(left: 20,top: 30),
              child: Text("Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  )
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 30,right: 30, top: 40),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                    labelText: 'Email',
                    //hintText: "Name",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)
                ),
                //decoration: InputDecoration(

                //labelText: '',
                //),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,bottom: 50, top: 20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                    labelText: 'Password',
                    //hintText: "Name",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)
                ),
                //decoration: InputDecoration(

                //labelText: '',
                //),
              ),
            ),

            Container(
              width: 300,
              height:60,
              margin: EdgeInsets.only(bottom: 25),
              child: ElevatedButton(

                  onPressed: () {
                    // 1. Get the username(email) and password
                    print(emailController.text);
                    print(passwordController.text);

                    // 2. Call Firebase authenticaiton and verify the username and password
                    FirebaseAuth.instance.signInWithEmailAndPassword( email: emailController.text, password: passwordController.text)
                        .then((value) {
                      print("You have successfully logged in");
                      // go to home screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page')),
                      );
                    }).catchError((e) {
                      print("Failed to Login");
                      print(e);

                    });

                  },
                  child: Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade100),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),

                          )
                      )
                  )

              ),
            ),

            Container(
              width: 300,
              height:60,
              margin: EdgeInsets.only(bottom: 0),
              child: ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage(title: 'Signup Page')),
                    );
                  },
                  child: Text('Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade200),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),

                          )
                      )
                  )

              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'select_diagnosed.dart';
import 'main.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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

             Expanded(
               flex: 12,
               child: Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 20,top: 30, bottom: 30),
                     child: Text("Sign Up",
                         style: TextStyle(
                       fontWeight: FontWeight.bold,
                           fontSize: 30
                     )
                     ),
                   ),

                 ],
                 // width: 200,
                 // height: 75,

                 //Image(
                   //image: NetworkImage('https://codingmindsacademy.com/img/my/logo1.png'),
                 ),
               ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left:30, bottom: 7),
                  child: Text("Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      )
                  ),
                ),
              ],
            ),
             //),

            // Expanded(
            //   flex: 10,
            //   child: Container(
            //     margin: EdgeInsets.all(20),
            //     child: Text(
            //       'Signup Page',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ),
            // ),

            Expanded(
              flex: 60,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                    child: TextField(
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),

                          ),
                          //hintText: "Name",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                      //decoration: InputDecoration(

                        //labelText: '',
                      //),
                    ),
                  ),


                  Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:30, bottom: 7),
                          child: Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18
                              )
                          ),
                        ),
                      ],
                    ),


                  Container(
                    margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                    child: TextField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),

                          ),
                          //hintText: "Emai",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)
                      ),
                      //decoration: InputDecoration(

                      //labelText: '',
                      //),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:30, bottom: 7),
                        child: Text("Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18
                            )
                        ),
                      ),
                    ],
                  ),


                  Container(
                    margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),

                          ),
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
                    height:70,
                    margin: EdgeInsets.all(40),
                    child: ElevatedButton(

                        onPressed: () {
                          // 1. get the input username and password
                          print(emailController.text);
                          print(passwordController.text);

                          // 2. send and save the username/password to Firebase

                          // FirebaseService.instance.callFunction()
                          //    .then((res) {
                          //       code
                          //    })
                          //    .catchError((e) {
                          //       code
                          //    });

                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text, password: passwordController.text)
                              .then((value) {
                            print("User Uid: " + value.user!.uid);
                            print("Successfully sign up!");
                            // save the user information in Realtime Database

                            // use Firebase Database
                            FirebaseDatabase.instance.reference().child("users/" + value.user!.uid).set(
                                {
                                  "Name" : nameController.text,
                                  "Email" : emailController.text,
                                  "Password" : passwordController.text,
                                }
                            ).then((value) {
                              // go back to Login screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SelectCondiitonPage(title: ' Medical Conditions')),
                              );
                            }).catchError((e){
                              print("Failed to save the user information.");
                            });

                          }).catchError((e) {
                            print("Failed to sign up!");
                            print(e);
                          });


                        },
                        child: Text('Create Account',
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

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 50,
                  //       child: Container(
                  //         margin: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                  //         child: TextField(
                  //           controller: firstnameController,
                  //           obscureText: false,
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             labelText: 'First Name',
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //
                  //     Expanded(
                  //       flex: 50,
                  //       child: Container(
                  //         margin: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
                  //         child: TextField(
                  //           controller: lastnameController,
                  //           obscureText: false,
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             labelText: 'Last Name',
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),

            ),



          ],
        ),
      ),
    );
  }
}

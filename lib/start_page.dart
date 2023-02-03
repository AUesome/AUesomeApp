import 'dart:ui';

import 'package:AUesome/login.dart';
import 'package:AUesome/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StartPage extends StatefulWidget {
 const StartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

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
              flex: 30,
              child: Image.asset(
                  'assets/images/auesome_logo.png',
                  height: 220,
                  width: 330,)

            ),
            // Expanded(
            //     flex: 10,
            //     child: Container(
            //       margin: EdgeInsets.only(left: 30,right: 30),
            //       child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //           Text(
            //             "Hi, welcome to AUesome!",
            //             style: TextStyle(
            //                       fontSize: 20,
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            Expanded(
                flex: 20,
                child: Column(
                  children: [

                     Container(
                        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        width: 300,
                        height: 75,

                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage(title: 'Login Page')),
                            );


                          },
                          child: Text("Sign In",
                          style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          )),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade100),

                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        //side: BorderSide(color: Colors.black)
                                    )
                                )
                            ),
                        ),

                      ),

                     Container(
                        margin: EdgeInsets.only(left:10,right: 10,top: 20,bottom: 30),
                        width: 300,
                       height: 75,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage(title: 'Sign Up Page')),
                            );

                          },
                          child: Text("Create Account",
                              style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700

                              )),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade200),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    //side: BorderSide(color: Colors.black)
                                  )
                              )
                          ),
                        ),
                      ),

                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
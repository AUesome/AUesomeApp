import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'signup.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'select_diagnosed.dart';
import '../widgets/display_image_widget.dart';
import 'package:AUesome/pages/edit_image.dart';
import '../user/user_data.dart';

class InitialProfilePage extends StatefulWidget {
  InitialProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InitialProfilePageState createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {

  DateTime _selectedDate = DateTime.now();
  final user = UserData.myUser;



  //String? selectedCondition;
  final TextEditingController medConditionController = TextEditingController();

  @override
  // void dispose() {
  //   medConditionController.dispose();
  //   super.dispose();
  // }
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

            // Expanded(
            //   flex: 12,
            //   child: Row(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(left: 20,top: 30, bottom: 30),
            //         child: Text("Sign Up",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30
            //             )
            //         ),
            //       ),
            //
            //     ],
            //     // width: 200,
            //     // height: 75,
            //
            //     //Image(
            //     //image: NetworkImage('https://codingmindsacademy.com/img/my/logo1.png'),
            //   ),
            // ),

            Container(
              margin: EdgeInsets.only(top:20),
              child: InkWell(
                  onTap: () {
                    navigateSecondPage(EditImagePage());
                  },
                  child: DisplayImage(
                    imagePath: 'https://cdn141.picsart.com/357697367045201.jpg',
                    onPressed: () {},
                  ),
                focusColor: Colors.black,

              ),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left:30, bottom: 7, top:30),
                  child: Text("Guardian's Name",
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
                      //controller: nameController,
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
                        child: Text("Child's Name",
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
                      //controller: emailController,
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
                        child: Text("Child's Date of Birth",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18
                            )
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 70,
                    child: ScrollDatePicker(
                      selectedDate: _selectedDate,
                      locale: Locale('en'),
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),
                  ),


                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10, top:30),
                          width: 300,
                          height: 75,

                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SelectCondiitonPage(title: 'Speech Level Page')),
                              );


                            },
                            child: Text("Continue",
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

                      ],
                    ),
                  )


                ],
              ),

            ),



          ],
        ),
      ),



        );


  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }



}

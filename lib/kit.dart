import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';

class KitPage extends StatefulWidget {
  KitPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _KitPageState createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {

  var cardColor2 = const Color(0xff99B8FF);
  static const cardColor3 = const Color(0xffbdb2ff);


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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    margin: EdgeInsets.only(left: 30, top: 30, bottom: 40 ),//bottom: 30),
                    child: Text("My Kit",
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
              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.person_pin_rounded,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Match Me!',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.animation,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Spinner',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.architecture_rounded ,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Clothespin',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.architecture_rounded ,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Chain Links',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.architecture_rounded ,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Push Bubbles',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.architecture_rounded ,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Shapes',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: cardColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:10,right: 10),
                        child: Icon(
                          Icons.architecture_rounded ,
                          size:75,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: cr,
                        children: [

                          Container(
                            margin: EdgeInsets.only( left:0,right:15),
                            child: Text('Emotion Flashcards',
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              )
                              ,),
                          ),
                          // Container(
                          //   margin:EdgeInsets.only(left:20, top:10),
                          //   child: Column(
                          //     //mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Motor Skills",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //             color: Colors.black45
                          //         ),),
                          //     ],
                          //
                          //
                          //
                          //   ),
                          // ),
                        ],
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),

                    ],
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }

}

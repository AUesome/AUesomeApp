import 'dart:async';
import 'dart:ui';
import 'package:AUesome/pages/edit_image.dart';
import 'package:AUesome/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'kitvids.dart';
import 'signup.dart';
import 'login.dart';
import 'start_page.dart';
import '../user/user.dart';
import '../widgets/display_image_widget.dart';
import '../user/user_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double value = 0.8;
  double percentValue = 0;
  int _counter = 0;
  int _currentIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pagelist= [];

  static const cardColor1 = const Color(0xffE8886D);
  var cardColor2 = const Color(0xff99B8FF);
  static const cardColor3 = const Color(0xffbdb2ff);
  final user = UserData.myUser;
  //final String title;
  //static const saturdayColor = const Color(0xffbdb2ff);
  // @override
  // void initState(){
  //   _pagelist
  //
  //     ..add(StartPage(title:"",))
  //     ..add(LoginPage(title:"",))
  //     ..add(DashboardPage(title:"",))
  //     ..add(KitVideoPage(title:"",))
  //     ..add(SignupPage(title:""));
  //   super.initState();
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

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
        automaticallyImplyLeading: false,

        //title: Text(widget.title),
      ),
      body:
      ListView(
        children: [
          Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top:30, left: 35, right: 50),
                  child:
                  InkWell(
                      onTap: () {
                        //navigateSecondPage(EditImagePage());
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://cdn141.picsart.com/357697367045201.jpg'),//user.image),
                        radius: 65,
                        //onPressed: () {},
                      )),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       'https://cdn141.picsart.com/357697367045201.jpg'
                  //   ),
                  //   radius: 60,
                  //
                  // ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 40,top:30),

                      child: Text("John Smith",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right:100),//top:15),
                          child: Text("   Parent ",
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),

              ],
            ),




          Container(
            height: 150,
            margin: EdgeInsets.only(top:20, left:15,right:15,bottom: 20),
            child: Card(
              elevation: 7,
              //color:cardColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        flex:20,
                        child: Container(
                          margin: EdgeInsets.only(left:20,top:20,right:15),
                            child:
                            Text("Welcome back to AUesome!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),)),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        margin: EdgeInsets.only(right: 25,top:20),
                        child: ElevatedButton(

                            onPressed: () {
                        // 1. Get the username(email) and password

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage(title: 'Home Page')),
                        );
                       //);
                        },
                            child: Text("About", style: TextStyle(fontSize:16, fontWeight: FontWeight.w700),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(cardColor2),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //side: BorderSide(color: Colors.black)
                                  )
                              )
                          ),


                        ),
                      )
                    ],

                  ),
                  Divider(
                    height: 35,
                    thickness: 2.5,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey.shade300
                  ),
                  // const ListTile(
                  //   //leading: Text('Complete Daily Activites'),
                  //   //Icon(Icons.album),
                  //   title: Text('Welcome back to AUesome! ',
                  //     style:
                  //     TextStyle(
                  //       fontWeight: FontWeight.w700,
                  //       fontSize: 24,
                  //     )
                  //     ,),
                  //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(left: 20),
                          child:
                          Text("3 Day Streak",

                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,

                            fontWeight: FontWeight.w300,
                          ),)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       flex:50,
          //       child: Container(
          //         height: 110,
          //         margin: EdgeInsets.only(left: 10),
          //         child: Card(
          //           elevation: 5,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(17.0),
          //           ),
          //           child: Column(
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 //mainAxisSize: MainAxisSize.min,
          //                 children: <Widget>[
          //                   Container(
          //                     width:40,
          //                     height:40,
          //                     margin: EdgeInsets.only(left:15, right:15,top:25),
          //                     child: CircularProgressIndicator(
          //                       backgroundColor: Colors.grey,
          //                       color: Colors.blueAccent,
          //                       strokeWidth: 8,
          //                       value: 0.8,
          //                       //setState()
          //                     ),
          //                   ),
          //                   Container(
          //                     margin: EdgeInsets.only(top:20, right: 10),
          //                     child: Column(
          //                       children: [
          //                         Text("Progress:",
          //                             style: TextStyle(
          //                               fontSize: 22,
          //                               fontWeight: FontWeight.w700,
          //                             )
          //                         ),
          //                         Container(
          //                             margin: EdgeInsets.only(),
          //                             child: Text("80%",
          //
          //                               style: TextStyle(
          //                                 fontSize: 25,
          //                                 color: Colors.blueAccent,
          //                                 //fontWeight: FontWeight.bold,
          //
          //                               ),)),
          //
          //                       ],
          //                     ),
          //                   ),
          //                   //(value*100).toString() + " %"),
          //                 ],
          //
          //               ),
          //
          //             ],
          //
          //           ),
          //
          //           //],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 50,
          //       child: Container(
          //         margin: EdgeInsets.only(right:10),
          //         height: 110,
          //         // width: 350,
          //         child: Card(
          //           elevation: 5,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(17.0),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             //mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //
          //               Container(
          //                 margin: EdgeInsets.only(left: 10),
          //                 child: Icon(
          //                   Icons.calendar_month_rounded,
          //                   size: 50,
          //                   color: CupertinoColors.darkBackgroundGray,
          //                 ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only( left: 10, right: 10),
          //                 child: Row(
          //                   children: [
          //                     Text("Schedule",
          //                         style: TextStyle(
          //                           fontSize: 22,
          //                           fontWeight: FontWeight.w700,
          //                         )
          //                     ),
          //
          //
          //                   ],
          //                 ),
          //               ),
          //               //(value*100).toString() + " %"),
          //             ],
          //
          //           ),
          //
          //           //],
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // ),
          Container(
            margin: EdgeInsets.only(top: 0, left: 15),
            child: Text(
              "Activities",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Container(

            height: 150,
            margin: EdgeInsets.only(top:10, left:15,right:15,bottom: 15),
            child: Card(
              elevation: 7,
              color:cardColor2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Column(
               // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top:15, left:15,right:15),
                    child: Text('Complete Daily Activities',
                      style:
                      TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      )
                      ,),
                  ),
                  // const ListTile(
                  //   //leading: Text('Complete Daily Activites'),
                  //   //Icon(Icons.album),
                  //   title: ,
                  //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(left:20, top:10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Communication Skills",
                            style: TextStyle(
                              color: Colors.black45
                            ),),
                                Text("Sensory Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Motor Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),],



                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        margin: EdgeInsets.only(left:100, right: 25,top:20),
                        child: ElevatedButton(

                          onPressed: () {
                            // 1. Get the username(email) and password

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage(title: 'Home Page')),
                            );
                            //);
                          },
                          child: Text("Begin", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    //side: BorderSide(color: Colors.black)
                                  )
                              )
                          ),


                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   margin: EdgeInsets.only(left: 15, bottom: 15),
          //   child: Text("Videos",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w600,
          //     ),),
          // ),
            Row(
             children: [
               Expanded(
                 flex:50,
                 child: Container(
                   height: 150,
                   margin: EdgeInsets.only(left: 15, right: 5),
                   child: Card(
                     color: cardColor3,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      size: 50,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( left: 10, right: 10),
                    child: Row(
                      children: [
                        Text("Schedule",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            )
                        ),


                      ],
                    ),
                  ),
                  //(value*100).toString() + " %"),
                ],

              ),

            ),
          ),
               ),
               Expanded(
                 flex: 50,
                 child: Container(
                   margin: EdgeInsets.only(right:15),
                   height: 150,
                   // width: 350,
                   child: Card(
                     color: cardColor3,

                     elevation: 5,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(17.0),
                     ),
                     child: Container(
                       //margin: EdgeInsets.only(),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           //mainAxisSize: MainAxisSize.min,
                           children: <Widget>[

                             Container(
                               margin: EdgeInsets.only(left: 10),
                               child: Icon(
                                 Icons.video_collection_rounded,
                                 size: 50,
                                 color: CupertinoColors.darkBackgroundGray,
                               ),
                             ),
                             Container(
                               margin: EdgeInsets.only( left: 10, right: 10),
                               child: Row(
                                 children: [
                                   Text("Videos",
                                       style: TextStyle(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w700,
                                       )
                                   ),


                                 ],
                               ),
                             ),
                           ]
                       ),
                     ),
                   ),
                 ),
               ),
    ],
    ),
    ],
    )
    );

  }
  void downloadData(){
    new Timer.periodic(
        Duration(seconds: 1),
            (Timer timer){
          setState(() {
            if(value == 1) {
              timer.cancel();
            }
            else {
              value = value + 0.1;
            }
          });
        }
    );
  }
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

// import 'dart:async';
// import 'dart:ui';
//
// import 'package:AUesome/signup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'kitvids.dart';
// import 'signup.dart';
// import 'login.dart';
// import 'start_page.dart';
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   double value = 0.8;
//   double percentValue = 0;
//   int _counter = 0;
//   int _currentIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   final List<Widget> _pagelist= [];
//
//    static const cardColor1 = const Color(0xffE8886D);
//   static const cardColor2 = const Color(0xff99B8FF);
//   static const cardColor3 = const Color(0xffBCA9FF);
//   // @override
//   // void initState(){
//   //   _pagelist
//   //
//   //     ..add(StartPage(title:"",))
//   //     ..add(LoginPage(title:"",))
//   //     ..add(DashboardPage(title:"",))
//   //     ..add(KitVideoPage(title:"",))
//   //     ..add(SignupPage(title:""));
//   //   super.initState();
//   // }
//
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _currentIndex = index;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/appbar.png'),
//                 fit: BoxFit.fill
//             ),
//
//           ),
//         ),
//         automaticallyImplyLeading: false,
//
//         //title: Text(widget.title),
//       ),
//       body:
//       ListView(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center ,
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   margin: EdgeInsets.all(30),
//                   child: CircleAvatar(
//                     backgroundImage: NetworkImage('https://banner2.cleanpng.com/20180802/xaw/kisspng-clip-art-portable-network-graphics-computer-icons-user-staff-person-man-profile-boss-circle-svg-png-5b62ed560cb369.529707841533209942052.jpg'),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   //mainAxisAlignment: MainAxisAlignment.end,
//                   //mainAxisAlignment: AxisDirection.left,
//                   children: [
//                     Text("Katherine Hua",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//
//                   ],
//                 )
//
//               ],
//             ),
//            Row(
//              children: [
//                Expanded(
//                  flex:50,
//                  child: Container(
//                    height: 110,
//                    margin: EdgeInsets.only(left: 10),
//                    child: Card(
//                      elevation: 5,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(17.0),
//                      ),
//                      child: Column(
//                        children: [
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            //mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[
//                              Container(
//                                width:40,
//                                 height:40,
//                                margin: EdgeInsets.only(left:15, right:15,top:25),
//                                child: CircularProgressIndicator(
//                                  backgroundColor: Colors.grey,
//                                  color: Colors.blueAccent,
//                                  strokeWidth: 8,
//                                  value: 0.8,
//                                  //setState()
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(top:20, right: 10),
//                                child: Column(
//                                  children: [
//                                    Text("Progress:",
//                                        style: TextStyle(
//                                          fontSize: 22,
//                                          fontWeight: FontWeight.w700,
//                                        )
//                                    ),
//                                    Container(
//                                      margin: EdgeInsets.only(),
//                                        child: Text("80%",
//
//                                        style: TextStyle(
//                                          fontSize: 25,
//                                          color: Colors.blueAccent,
//                                          //fontWeight: FontWeight.bold,
//
//                                        ),)),
//
//                                  ],
//                                ),
//                              ),
//                               //(value*100).toString() + " %"),
//                            ],
//
//                          ),
//
//                        ],
//
//                      ),
//
//                      //],
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 50,
//                  child: Container(
//                    margin: EdgeInsets.only(right:10),
//                    height: 110,
//                    // width: 350,
//                    child: Card(
//                      elevation: 5,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(17.0),
//                      ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             //mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//
//                               Container(
//                                 margin: EdgeInsets.only(left: 10),
//                                 child: Icon(
//                                   Icons.calendar_month_rounded,
//                                   size: 50,
//                                   color: CupertinoColors.darkBackgroundGray,
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only( left: 10, right: 10),
//                                 child: Row(
//                                   children: [
//                                     Text("Schedule",
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w700,
//                                         )
//                                     ),
//
//
//                                   ],
//                                 ),
//                               ),
//                               //(value*100).toString() + " %"),
//                             ],
//
//                           ),
//
//                       //],
//                     ),
//                  ),
//                ),
//
//              ],
//            ),
//              Container(
//                margin: EdgeInsets.only(top: 20, left: 15),
//                child: Text(
//                  "Activities",
//                  style: TextStyle(
//                    fontSize: 22,
//                    fontWeight: FontWeight.w600,
//                  ),
//                ),
//              ),
//
//              Container(
//                height: 150,
//                margin: EdgeInsets.only(top:10, left:15,right:15,bottom: 20),
//                child: Card(
//                  elevation: 7,
//                  color:cardColor1,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(17.0),
//                  ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     const ListTile(
//                       leading: Icon(Icons.album),
//                       title: Text('The Enchanted Nightingale'),
//                       subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         TextButton(
//                           child: const Text('BUY TICKETS'),
//                           onPressed: () {/* ... */},
//                         ),
//                         const SizedBox(width: 8),
//                         TextButton(
//                           child: const Text('LISTEN'),
//                           onPressed: () {/* ... */},
//                         ),
//                         const SizedBox(width: 8),
//                       ],
//                     ),
//                   ],
//                 ),
//             ),
//              ),
//             Container(
//               margin: EdgeInsets.only(left: 15, bottom: 15),
//               child: Text("My Kit",
//                 style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),),
//             ),
//              Container(
//                height: 150,
//                margin: EdgeInsets.only(left:15,right:15,bottom: 20),
//                child: Card(
//                  elevation: 7,
//                 color: cardColor2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(17.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     const ListTile(
//                       leading: Icon(Icons.album),
//                       title: Text('The Enchanted Nightingale'),
//                       subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         TextButton(
//                           child: const Text('BUY TICKETS'),
//                           onPressed: () {/* ... */},
//                         ),
//                         const SizedBox(width: 8),
//                         TextButton(
//                           child: const Text('LISTEN'),
//                           onPressed: () {/* ... */},
//                         ),
//                         const SizedBox(width: 8),
//                       ],
//                     ),
//                   ],
//                 ),
//             ),
//              ),
//             Container(
//               margin: EdgeInsets.only(left: 15, bottom: 15),
//               child: Text("Videos",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),),
//             ),
//             Container(
//               height: 150,
//               margin: EdgeInsets.only(left:15,right:15, bottom: 50 ),
//               child: Card(
//                 elevation: 7,
//                 color: cardColor3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(17.0),
//                 ),
//
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => KitVideoPage(title: 'Signup Page')),
//                     );
//                   },
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(Icons.album),
//                         title: Text('The Enchanted Nightingale'),
//                         subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           TextButton(
//                             child: const Text('BUY TICKETS'),
//                             onPressed: () {/* ... */},
//                           ),
//                           const SizedBox(width: 8),
//                           TextButton(
//                             child: const Text('LISTEN'),
//                             onPressed: () {/* ... */},
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         //     Card(
//         //       child: Row(
//         //         mainAxisSize: MainAxisSize.min,
//         //         children: <Widget>[
//         //           Container(
//         //             width:50,
//         //             height:50,
//         //             margin: EdgeInsets.all(20),
//         //             child: CircularProgressIndicator(
//         //               backgroundColor: Colors.grey,
//         //               color: Colors.blueAccent,
//         //               strokeWidth: 5,
//         //               value: 0.8,
//         // //setState()
//         //             ),
//         //           ),
//         //           Text("Progress: 80% "), //(value*100).toString() + " %"),
//         //         ],
//         //
//         //       ),
//         //
//         //       //],
//         //     )
//           ],
//
//
//
//       ),
//
//     );
//
//   }
//   void downloadData(){
//     new Timer.periodic(
//         Duration(seconds: 1),
//             (Timer timer){
//           setState(() {
//             if(value == 1) {
//               timer.cancel();
//             }
//             else {
//               value = value + 0.1;
//             }
//           });
//         }
//     );
//   }
// }
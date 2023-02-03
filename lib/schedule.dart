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

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  // static const mondayColor = const Color(0xffffadad);
  // static const tuesdayColor = const Color(0xffffd6a5);
  // static const wednesdayColor = const Color(0xfffdffb6);
  // static const thursdayColor = const Color(0xffcaffbf);
  // static const fridayColor = const Color(0xffa0c4ff);
  // static const saturdayColor = const Color(0xffbdb2ff);
  // static const sundayColor = const Color(0xffffc6ff);

  static const cardColor2 = const Color(0xff99B8FF);
  static const cardColor3 = const Color(0xffbdb2ff);

  int _currentIndex=0;


  List cardList=[
    Monday(),
    Tuesday(),
    Wednesday(),
    Thursday(),
    Friday(),
    Saturday(),
    Sunday(),

  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {

    List mondaySchedule = [
      //List category = [
       // "wonk",
      //],




    ];

    List tuesdaySchedule = [

    ];


    List wednesdaySchedule = [

    ];

    List thursdaySchedule = [

    ];

    List fridaySchedule = [

    ];

    List saturdaySchedule = [

    ];

    List sundaySchedule = [

    ];




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

        //BACKUP
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 30, bottom: 50 ),//bottom: 30),
                    child: Text("",
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

            Expanded(
              flex:60,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: 440.0,
                      autoPlay: false,
                      //autoPlayInterval: Duration(seconds: 3),
                      //autoPlayAnimationDuration: Duration(milliseconds: 800),
                      //autoPlayCurve: Curves.fastOutSlowIn,
                      //pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card){
                      return Builder(
                          builder:(BuildContext context){
                            return Container(
                              margin: EdgeInsets.only(bottom:0,left:7,right: 7),
                              height: MediaQuery.of(context).size.height*0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 7,
                                //color:cardColor1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.transparent,
                                child: card,
                                //ListView(
                                  //children: [
                                    // Card(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(15.0),
                                    //     child: SizedBox(
                                    //       width: 430,
                                    //       height: 700,
                                    //       child: Column(
                                    //         children: [
                                    //           Text(
                                    //             'Algorithms',
                                    //             style: TextStyle(
                                    //                 color: Colors.greenAccent[400],
                                    //                 fontSize: 30), //TextStyle
                                    //           ), //Text
                                    //           SizedBox(height: 10),
                                    //           Row(
                                    //             children: <Widget>[
                                    //               SizedBox(
                                    //                 width: 10,
                                    //               ), //SizedBox
                                    //               Text(
                                    //                 'Library Implementation Of Searching Algorithm: ',
                                    //                 style: TextStyle(fontSize: 17.0),
                                    //               ), //Text
                                    //               SizedBox(width: 10), //SizedBox
                                    //               /** Checkbox Widget **/
                                    //               Checkbox(
                                    //                 value: this.value,
                                    //                 onChanged: (bool value) {
                                    //                   setState(() {
                                    //                     this.value = value;
                                    //                   });
                                    //                 },
                                    //               ), //Checkbox
                                    //             ], //<Widget>[]
                                    //           ), //Row
                                    //         ],
                                    //       ), //Column
                                    //     ), //SizedBox
                                    //   ), //Padding
                                    // ),

                                  //],

                                //),
                              ),
                            );
                          }
                      );
                    }).toList(),
                  ),
              ),
            ),

            Expanded(
              flex:20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,

                      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.black87 : Colors.grey,
                      ),
                    );
                  }),
                ),
            ),


          ],
        ),
      )
    );
  }
}

class Monday extends StatelessWidget {
  Monday({ Key? key}) : super(key: key);

  //_MondayState createState() => _MondayState();


  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor2,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Monday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fine Motor Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Clothespin",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Match clothespins onto boards",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Motor Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Chain Links",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Practice hand eye coordination",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Attention Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Spinner",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Spin a top and catch it on cue ",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

class Tuesday extends StatelessWidget {
  const Tuesday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor3,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Tuesday",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    )
                ),
        ]
              ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sensory Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Push Bubble",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("For stress & anxiety relief",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Matching & Motor Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Shapes",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Match by size, shape, and color",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Receptive Communiation",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Emotion Flashcards",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Match pictures of people to emotions",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

            ],
         //],
    ),
    );

  }
}

class Wednesday extends StatelessWidget {
  const Wednesday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor2,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Wednesday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Motor Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Zoob Blocks",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Build shapes and structures",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Behavioral Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Match Me",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Match objects to their descriptions",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sensory Skills",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),),

                        Text("Spinner Toy",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),),
                        Text("",
                          style: TextStyle(
                              fontSize: 5,
                              color: Colors.black45
                          ),),
                        Text("Play with a soccer ball spinner",
                          style: TextStyle(
                              color: Colors.black45
                          ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:35,
                    child: Container(
                      width: 80,
                      height: 35,
                      margin: EdgeInsets.only( right: 25),
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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
                    ),
                  )

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}

class Thursday extends StatelessWidget {
  const Thursday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor3,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Thursday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sensory Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Texture Tray",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Identify and feel different textures",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:35, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Communication Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Story Flashcards",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Make a story from flashcards",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:40, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sensory Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Sensory Brush",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Helps desensitize Sensory Processing Disorder",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:45, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}

class Friday extends StatelessWidget {
  const Friday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor2,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Friday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cognitive Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Bean Bag",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Toss and catch with hand-eye coordination",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:35, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Motor Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Threading",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Lace strings through holes",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:40, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sensory Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Fidget Toy",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Bend, stretch, and play",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:45, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}

class Saturday extends StatelessWidget {
  const Saturday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor3,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Saturday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Memorization",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Match Me!",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Match words to images",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:35, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Self-Care",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Meditate",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Calm down your mind ",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:40, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Motor Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Clothespin",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Play with clothespins ",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:45, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}

class Sunday extends StatelessWidget {
  const Sunday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _SchedulePageState.cardColor2,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Sunday",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Memorization",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Match Me!",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Match words to images",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:35, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Self-Care",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Meditate",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Calm down your mind ",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:40, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),

          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

          Container(
            margin: EdgeInsets.only(left:30,),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Motor Skills",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45
                        ),),

                      Text("Clothespin",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),),
                      Text("",
                        style: TextStyle(
                            fontSize: 5,
                            color: Colors.black45
                        ),),
                      Text("Play with clothespins ",
                        style: TextStyle(
                            color: Colors.black45
                        ),),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left:45, right: 25,top:15),
                    child: ElevatedButton(

                      onPressed: () {

                      },
                      child: Text("Start", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
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

                ]
            ),
          ),
          Divider(
              height: 35,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.white
          ),

        ],
        //],
      ),
    );
  }
}


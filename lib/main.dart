import 'package:AUesome/kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'set_userprofile.dart';
import 'start_page.dart';
//import 'speech_input2.dart';
import 'signup.dart';
//import 'settings_copy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'select_diagnosed.dart';
import 'kit_videos.dart';
import 'schedule.dart';
//import 'kitvids.dart';
import 'dashboard.dart';
import 'schedule.dart';
import 'kit.dart';
import 'package:flutter/material.dart';
import 'package:AUesome/pages/profile_page.dart';
import 'package:flutter/services.dart';
import 'set_userprofile.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUesome',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display Regular',
        //scaffoldBackgroundColor: const Color(0xFFFFFF),
        backgroundColor: Colors.white,
        dividerTheme: DividerThemeData(
          space:40,
          thickness: 10,
          color: Colors.black54,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,


    ),
      home: StartPage(title: ''),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pagelist= [];

  @override
  void initState(){
    _pagelist

      ..add(SchedulePage(title:"",))
      ..add(KitPage(title:"",))
      ..add(DashboardPage(title:"",))
      ..add(KitVideoPage(title:"",))
      ..add(InitialProfilePage(title: ""));
      //..add(ProfilePage());

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),
      //),
      body: _pagelist[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: '',
              backgroundColor: Colors.lightBlueAccent,

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.scanner),
                label: '',
                backgroundColor: Colors.lightBlueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                backgroundColor: Colors.lightBlueAccent
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_rounded),
              label: '',
              backgroundColor: Colors.lightBlueAccent,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: '',
              backgroundColor: Colors.lightBlueAccent,

            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.grey.shade300,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.lightBlueAccent
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
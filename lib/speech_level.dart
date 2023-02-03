import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'signup.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';


class SpeechLevelPage extends StatefulWidget {
  SpeechLevelPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SpeechLevelPageState createState() => _SpeechLevelPageState();
}

class _SpeechLevelPageState extends State<SpeechLevelPage> {

  final List<String> speechLevel = [
    'Verbal',
    'Can speak but hard to understand',
    'Cannot speak but knows words',
    'Non-verbal but can say Yes/No',
    'Nonverbal',
    'Other',

  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> speechLevel) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in speechLevel) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != speechLevel.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (speechLevel.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

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
          children: [
            Expanded(
              flex: 75,
              child: Column(

                children: <Widget>[

                  Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      child: Text("Preliminary Survey ",
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'SF Pro Display Regular',
                            fontWeight: FontWeight.bold

                        ),)
                  ),
                  Container(
                    width: 300,

                      margin: EdgeInsets.only( left:30, right:15, bottom: 20),
                      alignment: AlignmentDirectional.center,
                      child: Text("Please select any medical or developmental diagnoses your child has recieved",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SF Pro Display Regular',
                          fontWeight: FontWeight.w300,

                        ),)
                  ),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: _addDividersAfterItems(speechLevel),
                        //customItemsHeights: _getCustomItemsHeights(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonHeight: 40,
                        dropdownMaxHeight: 150,
                        buttonWidth: 250,
                        //itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),





                  //Column(

                  // children: [
                  //   Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //
                  //     children: [
                  //       Container(
                  //
                  //         margin: EdgeInsets.only(right:30,left:30, bottom: 25),
                  //         child: Text("Feel free to mention other challenges: ",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 20
                  //         ),),
                  //       ),
                  //     ],
                  //   ),
                  //   Container(
                  //     height: 200,
                  //     margin: EdgeInsets.only(right:30,left:30),
                  //     child: TextField(
                  //       keyboardType: TextInputType.multiline,
                  //       textInputAction: TextInputAction.newline,
                  //       decoration: InputDecoration(
                  //              border: OutlineInputBorder(),
                  //              //labelText: 'Write here: ',
                  //            ),
                  //       minLines: null,
                  //       maxLines: 4,  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                  //       expands: false, // when user presses enter it will adapt to it
                  //     ),
                  //
                  //     // const TextField(
                  //     //   obscureText: true,
                  //     //   decoration: InputDecoration(
                  //     //     border: OutlineInputBorder(),
                  //     //     labelText: 'Write here: ',
                  //     //   ),
                  //     // ),
                  //   ),
                  // ],
                  //),



                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: 300,
                    height: 75,

                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpeechLevelPage(title: 'Speech Level Page')),
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'signup.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'speech_level.dart';

class SelectCondiitonPage extends StatefulWidget {
  SelectCondiitonPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SelectCondiitonPageState createState() => _SelectCondiitonPageState();
}

class _SelectCondiitonPageState extends State<SelectCondiitonPage> {

  final List<String> medicalConditions = [
    'Autism Spectrum Disorder',
    'ADHD',
    'Aphasia',
    'Apraxia',
    'Cerebral Palsy',
    'Eplilepsy',
    'Developmental Delay',
    'Down Syndrome',
    'Premature Birth',
    'Rett Syndrome',
    'Speech Delay',
    'Selective Mutism',
    'Other',
  ];

  List<String> selectedConditions = [];

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

                             margin: EdgeInsets.only( left:30, right:15, bottom: 20),
                              alignment: AlignmentDirectional.center,
                              child: Text("Please select any medical or developmental diagnoses your child has recieved",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Display Regular',
                                    fontWeight: FontWeight.w300,

                                ),)
                          ),
                          Container(
                            width: 300,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: false,
                                hint: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    'Select Condition',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ),


                                items: medicalConditions.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    //disable default onTap to avoid closing menu when selecting an item
                                    enabled: false,
                                    child: StatefulBuilder(
                                      builder: (context, menuSetState) {
                                        final _isSelected = selectedConditions.contains(item);
                                        return InkWell(
                                          onTap: () {
                                            _isSelected
                                                ? selectedConditions.remove(item)
                                                : selectedConditions.add(item);
                                            //This rebuilds the StatefulWidget to update the button's text
                                            setState(() {});
                                            //This rebuilds the dropdownMenu Widget to update the check mark
                                            menuSetState(() {});
                                          },
                                          child: Container(
                                            height: double.infinity,
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                _isSelected
                                                    ? const Icon(Icons.check_box_outlined)
                                                    : const Icon(Icons.check_box_outline_blank),
                                                const SizedBox(width: 18),
                                                Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }).toList(),
                                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                value: selectedConditions.isEmpty ? null : selectedConditions.last,
                                onChanged: (value) {},
                                buttonHeight: 55,
                                buttonWidth: 200,
                                itemHeight: 40,
                                itemPadding: EdgeInsets.zero,
                                selectedItemBuilder: (context) {
                                  return medicalConditions.map(
                                        (item) {
                                      return Container(
                                        alignment: AlignmentDirectional.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          selectedConditions.join(', '),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      );
                                    },
                                  ).toList();
                                },




                                // items: medicalConditions
                                //     .map((item) => DropdownMenuItem<String>(
                                //   value: item,
                                //   enabled: false, //
                                //   child: Text(
                                //     item,
                                //     style: const TextStyle(
                                //       fontSize: 14,
                                //     ),
                                //   ),
                                // ))
                                //     .toList(),
                                // value: selectedCondition,
                                // onChanged: (value) {
                                //   setState(() {
                                //     selectedCondition = value as String;
                                //   });
                                // },
                                // buttonHeight: 40,
                                // buttonWidth: 200,
                                // itemHeight: 40,
                                // dropdownMaxHeight: 200,
                                // searchController: medConditionController,
                                // searchInnerWidget: Padding(
                                //   padding: const EdgeInsets.only(
                                //     top: 8,
                                //     bottom: 4,
                                //     right: 8,
                                //     left: 8,
                                //   ),
                                //   child: TextFormField(
                                //     controller: medConditionController,
                                //     decoration: InputDecoration(
                                //       isDense: true,
                                //       contentPadding: const EdgeInsets.symmetric(
                                //         horizontal: 10,
                                //         vertical: 8,
                                //       ),
                                //       hintText: 'Search for an item...',
                                //       hintStyle: const TextStyle(fontSize: 12),
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(8),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // searchMatchFn: (item, searchValue) {
                                //   return (item.value.toString().contains(searchValue));
                                // },
                                // //This to clear the search value when you close the menu
                                // onMenuStateChange: (isOpen) {
                                //   if (!isOpen) {
                                //     medConditionController.clear();
                                //   }
                                // },
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

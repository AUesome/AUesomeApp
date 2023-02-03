import 'package:flutter/material.dart';
import 'package:AUesome/user/user_data.dart';
import 'package:AUesome/widgets/appbar_widget.dart';

// This class handles the Page to edit the About Me Section of the User Profile.
class EditDescriptionFormPage extends StatefulWidget {
  @override
  _EditDescriptionFormPageState createState() =>
      _EditDescriptionFormPageState();
}

class _EditDescriptionFormPageState extends State<EditDescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateUserValue(String description) {
    user.aboutMeDescription = description;
  }

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
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:25),
                  child: SizedBox(
                      width: 350,
                      child: const Text(
                        "User\nDescription",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                        // height: 250,
                        // width: 350,
                        child: Container(
                              //height: 200,
                              margin: EdgeInsets.only(right:5,left:5, top:25),
                              child: TextField(
                                controller: descriptionController,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                       border: OutlineInputBorder(),
                                       alignLabelWithHint: true,
                                    contentPadding:
                                    EdgeInsets.fromLTRB(10, 15, 10, 100),
                                    hintMaxLines: 3,
                                    hintText:'Tell us about yourself!',
                                       //labelText: 'Write here: ',
                                     ),
                                minLines: null,
                                maxLines: null,  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                expands: false,







                              // const TextField(
                              //   obscureText: true,
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     labelText: 'Write here: ',
                              //   ),
                              // ),
                            ),
                        //TextFormField(
                        //   // Handles Form Validation
                        //   validator: (value) {
                        //     if (value == null ||
                        //         value.isEmpty ||
                        //         value.length > 200) {
                        //       return 'Please describe yourself but keep it under 200 characters.';
                        //     }
                        //     return null;
                        //   },
                        //   controller: descriptionController,
                        //   textAlignVertical: TextAlignVertical.top,
                        //   decoration: const InputDecoration(
                        //       alignLabelWithHint: true,
                        //       contentPadding:
                        //           EdgeInsets.fromLTRB(10, 15, 10, 100),
                        //       hintMaxLines: 3,
                        //       hintText:
                        //           'Write a little bit about yourself or your condiiton'),
                        // )
                    )
                    ),
                ),




                Padding(
                    padding: EdgeInsets.only(top: 45),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                updateUserValue(descriptionController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}

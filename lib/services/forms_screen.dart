import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';

class FormsScreen extends StatefulWidget {
  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  String _name;
  String _email;
  String _phonenumber;
  String _whatsAppNumber;
  String _currentCity;
  String drowpdown = "Select";
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Name",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[800],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

      validator: (String value) {
        if (value.isEmpty || value.length < 3) {
          return "Name is missing";
        } else
          return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "e-mail",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[800],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return "e-Mail is missing";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return "PLease Enter a Valid E-mail Address";
        }
        return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Phone Number",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[800],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Empty';
        }

        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildWhatsAppNumber() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "WhatsApp Number",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[800],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'WhatsApp number is Empty';
        }

        return null;
      },
      onSaved: (String value) {
        _whatsAppNumber = value;
      },
    );
  }

  Widget _buildCurrrentCity() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Current City",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[800],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Current City is Required";
        }
      },
      // it will got called after .save()
      onSaved: (String value) {
        _currentCity = value;
      },
    );
  }

  String dropdownValue;

  @override
  Widget _buildDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,

      //elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue[800],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Intern',
        'Software Engineer',
        'Sr. Software Engineer',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        "Select profile to apply",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildChooseResume() {
    return RaisedButton(
      onPressed: () async {
        FilePickerResult result = await FilePicker.platform.pickFiles();

        if (result != null) {
          PlatformFile file = result.files.first;

          print(file.name);
          print(file.bytes);
          print(file.size);
          print(file.extension);
          print(file.path);
        }
      },
      child: Text('Choose Resume'),
    );
  }

  Widget _buildUploadResume() {
    return OutlineButton(
      onPressed: () {},
      child: Text('Upload Resume'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('General Information'),
        centerTitle: true,
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        margin: EdgeInsets.all(22.0),
        // using form class of flutter
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                // making everything intact in the center
                mainAxisAlignment: MainAxisAlignment.center,
                // getting all the widget on top of each other,by using column widget
                children: <Widget>[
                  _buildName(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildEmail(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPhoneNumber(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildWhatsAppNumber(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildCurrrentCity(),
                  _buildDropDown(),
                  _buildChooseResume(),
                  _buildUploadResume(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        // if the input value is correct it will be saved
                        _formKey.currentState.save();
                        print(_name);
                        Navigator.pushNamed(context, '/work_expirence');
                      },

                      label: Text("Next"),
                      color: Colors.pink[900],
                      icon: Icon(Icons.arrow_forward),
                      // Text(
                      //   'Submit',
                      //   style: TextStyle(
                      //     fontSize: 16.0,
                      //     color: Colors.blue,
                      //   ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

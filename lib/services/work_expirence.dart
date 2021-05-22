import 'package:flutter/material.dart';

class WorkExpirence extends StatefulWidget {
  @override
  _WorkExpirenceState createState() => _WorkExpirenceState();
}

class _WorkExpirenceState extends State<WorkExpirence> {
  String _companyName;
  String _location;
  String _role;
  String _jobDescription;
  String _servedYears;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCompanyName() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Company Name",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
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
          return "Company Name is Required";
        } else
          return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _companyName = value;
      },
    );
  }

  Widget _buildLocation() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Company Location",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
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
          return "Company Location is Required";
        } else
          return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _location = value;
      },
    );
  }

  Widget _buildRole() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Previous Role",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
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
          return "PLease Provide Your Role";
        } else
          return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _role = value;
      },
    );
  }

  Widget _buildJobDescription() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      maxLines: 5,
      decoration: InputDecoration(
        labelText: "Job Description",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
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
          return "PLease Provide Your Job Dexscription";
        } else
          return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _jobDescription = value;
      },
    );
  }

  Widget _buildServedYears() {
    return TextFormField(
      //controller: _phoneController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Expirence(In Years)",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
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
          return 'Number of Years can not be empty';
        }

        return null;
      },
      // it will got called after .save()
      onSaved: (String value) {
        _servedYears = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Work Experience '),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                  _buildCompanyName(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildLocation(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildRole(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildServedYears(),
                  SizedBox(
                    height: 10.0,
                  ),

                  _buildJobDescription(),
                  // _buildDropDown(),
                  // _buildChooseResume(),
                  // _buildUploadResume(),
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
                        print(_companyName);
                        Navigator.pushNamed(context, '/work_expirence');
                      },

                      label: Text("Next"),
                      color: Colors.amber,
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

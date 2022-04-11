import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lovebirds_app/Login/register_account.dart';
import 'package:lovebirds_app/helper/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network_Utils/api.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  //login variables
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg){
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
   // _scaffoldKey.currentState?.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Account Login'),
        backgroundColor: Constants.lightPrimary,
        titleTextStyle: Constants.appBarStyle,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Align(
        //top left aligned
        alignment: const Alignment(-1.0, 1.0),

        //nesting in a container allows for margin on all sides
        child: Container(
          margin:
          const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          //column which contains all form elements
          child: Form(
            key: _formKey,
          child: Column(
            //aligning to the left
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //form heading
              const Text(
                "Email",
                textAlign: TextAlign.left,
                style: Constants.sectionHeading,
              ),

              Constants.formPadding,

              //Textfield
              Material(
                borderRadius: Constants.borderRadius,
                shadowColor: Constants.formfieldColor,
                elevation: Constants.elevation,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: Constants.floatingLabelBehaviour,
                      border: Constants.outlineInputBorder,
                      labelText: 'Enter your email',
                      fillColor: Colors.white),

                  validator: (String? emailValue) {
                    if (emailValue != null && emailValue.isEmpty) {
                      return 'Please enter email';
                    }
                    email = emailValue;
                    return null;
                  },
                ),
              ),

              Constants.sectionPadding,

              const Text(
                "Password",
                textAlign: TextAlign.left,
                style: Constants.sectionHeading,
              ),

              Constants.formPadding,

              Material(
                borderRadius: Constants.borderRadius,
                shadowColor: Constants.formfieldColor,
                elevation: Constants.elevation,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: Constants.floatingLabelBehaviour,
                      border: Constants.outlineInputBorder,
                      labelText: 'Enter your password',
                      fillColor: Colors.white),

                  validator: (String? passwordValue) {
                    if (passwordValue != null && passwordValue.isEmpty) {
                      return 'Please enter email';
                    }
                    password = passwordValue;
                    return null;
                  },
                ),
              ),

              Constants.sectionPadding,
              Constants.formPadding,

              //Create account button
              Center(
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO: Fix create account functionality
                      if(_formKey.currentState?.validate() != null) {
                        _login();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                        _isLoading? 'Processing' : 'Sign In',
                        style: Constants.buttonRedStyle),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.buttonRed),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 25.0, horizontal: 202),
                      ),
                    ),
                  ),
                ),
              ),

              Constants.sectionPadding,
              Constants.formPadding,
              Constants.formPadding,

              Row(
                children: [
                  const Expanded(child:
                  Text("Don't have an account?", style: Constants.title,)
                  ),

                  ElevatedButton(
                    // Contact guest button
                    onPressed: () {
                      // TODO: Register Account Functionality goes here
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => RegisterAccount()));
                    },
                    child:
                    const Text('Register', style: Constants.buttonWhiteStyle),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ),
      ),
    );
  }

  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MainPage(title: 'LoveBirds')
        ),
      );
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });

  }
}
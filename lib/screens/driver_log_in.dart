import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/user.dart';
import 'driver_sign_up.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Iconsax.arrow_circle_left5,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                  height: 220,
                  width: 300,
                  child: Image.asset('media/img/logo.png')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailTextController,
                  onChanged: (input) => email = input,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return 'Enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: passwordTextController,
                  onChanged: (input) => password = input,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter passwod';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: 300,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Hompege()));
                      },
                      child: Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                child: Row(
                  children: [
                    Text('Do not have an Account?',
                        style: TextStyle(color: Colors.black)),
                    TextButton(
                        onPressed: () {
                         

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverSignUp()));
                        },
                        child: Text('Sign up', style: TextStyle(fontSize: 25)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/user.dart';

class DriverSignUp extends StatefulWidget {
  const DriverSignUp({Key? key}) : super(key: key);

  @override
  State<DriverSignUp> createState() => _DriverSignUpState();
}

class _DriverSignUpState extends State<DriverSignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  String email = '';
  String password = '';
  String name = '';
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
      body:  Container(
          // alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                
                Container(
                  height: 220,
                  width: 300,
                  child: Image.asset('media/img/logo.png')),
                // SizedBox(
                //   height: 170,
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailTextController,
                    onChanged: (value) {
                      email = value;
                    },
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
                    onChanged: (value) {
                     password = value;
                    },
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
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: usernameTextController,
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Username ';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'User Name',
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
                          if (_formKey.currentState!.validate()) {
                           FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((value) => print('sucess'));
                          } else {
                            print('not ok');
                          }
                        },
                        child: Text('sign up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                  child: Row(
                    children: [
                      Text('Already have an Account?',
                          style: TextStyle(color: Colors.black)),
                      TextButton(
                    
                          onPressed: ()
                           {
                               Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                           },
                          child: Text('Login', style: TextStyle(fontSize: 25,))),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('media/custom-icons/google.png'),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('media/custom-icons/FB.png'),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          BootstrapIcons.apple,
                          size: 25,
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      
    );
  }
}

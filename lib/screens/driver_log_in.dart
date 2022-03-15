import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/dialog.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:the_mechanic/main.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/navi.dart';
import 'driver_sign_up.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:Colors.black45,
      
      body: Container(
       
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset('media/img/New White.png',height: 170,),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailTextController,
                  validator: (emailTextController) {
                    if (emailTextController!.isEmpty) {
                      return 'Enter Email';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailTextController)) {
                      return null;
                    } else {
                      return 'Enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
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
                  validator: (passwordTextController) {
                    if (passwordTextController!.isEmpty) {
                      return 'Enter passwod';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.password),
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
           
                          child:  RoundedLoadingButton(
                  animateOnTap: true,
                  child: Wrap(
                    children: const [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                  controller: _btnController,
                  width: MediaQuery.of(context).size.width * 0.7,
                  color:  Color.fromARGB(255, 255, 214, 64),
                  elevation: 1,
                  onPressed: () async {
                   if (_formKey.currentState!.validate()) {
                       loginAndAuthenticateUser(context);
                       
                    } else {
                      
                      _btnController.reset();
                    }
                  }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                child: Row(
                  children: [
                    Text('Do not have an Account?',
                        style: TextStyle(color: Colors.white)),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginAndAuthenticateUser(BuildContext context) async {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Mydialog(message: "Logging in ........");
    //     });
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextController.text.trim(),
                password: passwordTextController.text.trim())
            .catchError((errMsg) {
               Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      //save user info to database

      usersRef.child(firebaseUser.uid).get().then((DataSnapshot snap) async {
        if (snap.value != null) {
        Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Navi(),
      ),
      (route) => false,
    );
          displayToastMessage("Account has been logged in successful", context);
        } else {
           Navigator.pop(context);
          await _firebaseAuth.signOut();
          displayToastMessage(
              "Account has not been created.Try Again", context);
        }
      });
    } else {
       Navigator.pop(context);
      displayToastMessage("Error Loging in", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message, timeInSecForIosWeb: 10,);
  }
}

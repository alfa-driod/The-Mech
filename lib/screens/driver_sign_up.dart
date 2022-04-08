import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';
import 'package:the_mechanic/dialog.dart';
import 'package:the_mechanic/main.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/navi.dart';
import 'package:the_mechanic/screens/user_profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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
  final _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        // alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(
                'media/img/New White.png',
                height: 170,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailTextController,
                  validator: (emailTextController) {
                    if (emailTextController!.isEmpty) {
                      displayToastMessage("Please input an Email", context);
                      return 'Enter Email';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailTextController)) {
                      return null;
                    } else {
                      displayToastMessage(
                          "Please Your Email format is wrong", context);
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
                        borderSide: BorderSide(color: Colors.yellow)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.green)),
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
                      displayToastMessage("Please input a password", context);
                      return 'Enter password';
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
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: usernameTextController,
                  validator: (usernameTextController) {
                    if (usernameTextController!.isEmpty) {
                      displayToastMessage(
                          "Please Enter Your Username", context);
                      return 'Enter your Username ';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'User Name',
                    prefixIcon: Icon(Icons.person),
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
                child: RoundedLoadingButton(
                    animateOnTap: true,
                    child: Wrap(
                      children: const [
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                    controller: _btnController,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Color.fromARGB(255, 255, 214, 64),
                    elevation: 1,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        registerNewUser(context);
                      } else {
                        _btnController.reset();
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                child: Row(
                  children: [
                    Text('Already have an Account?',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 25,
                            ))),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       // return Mydialog(message: "Signing in ");
    //     });
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextController.text.trim(),
                password: passwordTextController.text.trim())
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      //save user info to database

      Map UserDataMap = {
        "email": emailTextController.text,
        "password": passwordTextController.text,
        "username": usernameTextController.text,
        "ImageUrl": "https://faxpulse.com/wp-content/uploads/2017/10/FP_Icon_G.png"
      };
      usersRef.child(firebaseUser.uid).set(UserDataMap);
      displayToastMessage("Account has been created successful", context);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()));

      Navigator.pop(context);
      displayToastMessage("Account has not been created.Try Again", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 5,
    );
  }
}

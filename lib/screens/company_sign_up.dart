import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';

class CompanyRegister extends StatelessWidget {
  const CompanyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldController = TextEditingController();
    GlobalKey<FormState> subKey = GlobalKey<FormState>();
    var _character;
    _validator(value) {
      if (value!.isEmpty()) return 'Field is required';
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_circle_left5,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('media/img/company_register_car.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Formfield(hint: 'Email'),
              Formfield(hint: 'Password'),
              Formfield(hint: 'Company Name'),
              Formfield(hint: 'Company Location'),
              Formfield(hint: 'Company Documents'),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (subKey.currentState!.validate()) {
                        _character = fieldController.text;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verification(),
                          ));
                    },
                    child: Text(
                      'Regiter Company',
                      style: TextStyle(fontSize: 22),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('media/img/company_register_car.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 55,
            child: Icon(
              Icons.check_circle_rounded,
              size: 110,
              color: Colors.green,
            ),
          ),
          Text(
            'Submitted \nWait for Verification',
            style: TextStyle(
              fontSize: 45,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}

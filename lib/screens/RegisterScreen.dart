import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isro/widgets/RoundedButton.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../constants.dart';
import 'Home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String title = 'ISRO';
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email = '', emailError = '';
  late String password = '', passwordError = '';
  late String conPassword = '', conPassError = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: LoadingOverlay(
        isLoading: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                      errorText: emailError.isEmpty ? null : emailError),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      errorText: passwordError.isEmpty ? null : passwordError),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    conPassword = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm your password',
                      errorText: conPassError.isEmpty ? null : conPassError),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () => registerNewUser(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    bool val = true;
    if (email.isEmpty) {
      setState(() {
        emailError = 'Please enter your email!';
      });
      val = false;
    } else
      setState(() {
        emailError = '';
      });
    if (password.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password!';
      });
      val = false;
    } else if (password.length < 6) {
      setState(() {
        passwordError = 'Password is too short!';
      });
      val = false;
    } else
      setState(() {
        passwordError = '';
      });
    if (conPassword.isEmpty) {
      setState(() {
        conPassError = 'Please confirm your password!';
      });
      val = false;
    } else {
      if (conPassword != password) {
        setState(() {
          conPassError = 'Password did not match!';
        });
        val = false;
      } else
        setState(() {
          conPassError = '';
        });
    }
    return val;
  }

  void registerNewUser(BuildContext context) async {
    if (validate()) {
      setState(() {
        showSpinner = true;
      });
      try {
        final newUser = (await auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;
        setState(() {
          showSpinner = false;
        });
        if (newUser != null) {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: title)));
        }
      } catch (e) {
        setState(() {
          showSpinner = false;
        });
        showSpinner = false;
        var msg = e as FirebaseAuthException;
        print(e);
        if (msg.message != null)
          Fluttertoast.showToast(
              msg: msg.message.toString(),
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG);
        print(e);
      }
      setState(() {
        showSpinner = false;
      });
    }
  }
}

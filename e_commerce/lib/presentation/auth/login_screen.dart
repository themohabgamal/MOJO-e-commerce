import 'package:e_commerce/main.dart';
import 'package:e_commerce/presentation/auth/signup_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 18),
              Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.mainColor),
              ),
              SizedBox(height: 16),
              Text(
                'Log in to your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  prefixIcon: Icon(IconlyLight.message),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', prefixIcon: Icon(IconlyLight.lock)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              MyTheme.mainColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          logIn();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Account?',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SignupScreen.routeName);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: MyTheme.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    Alert.showAlert(
        context, "assets/animations/loading.json", "Authenticating");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      navigatorKey.currentState!.pop();
      Alert.showAlert(
          context, "assets/animations/success.json", "Logged in successfully");
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Alert.showAlert(context, "assets/animations/error.json", "${e.message}");
    }
  }
}

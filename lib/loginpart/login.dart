import 'package:best_food_project/loginpart/forgot_password.dart';
import 'package:best_food_project/loginpart/sign_up.dart';
import 'package:best_food_project/loginpart/wecome_page/homepage/home_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loggedIn = false;
  bool isSelected = false;
  final loginFormkey = GlobalKey<FormState>();
  bool isVisible = true;
  Icon passIcon = const Icon(Icons.visibility_off);
  String _errorText = "";

  clearText() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: loginFormkey,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        errorStyle: TextStyle(
                            color: Colors.red, fontSize: mq.width * .04),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        hintText: 'Enter your Email',
                        label: Text(
                          "Email",
                          style: TextStyle(fontSize: mq.width * .04),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No User for this email';
                        } else if (!EmailValidator.validate(value)) {
                          return ' Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(11.0)),
                    TextFormField(
                      maxLines: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: false,
                      controller: passwordController,
                      obscureText: isVisible,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.0)),
                        errorStyle: TextStyle(
                            color: Colors.red, fontSize: mq.width * .04),
                        prefixIcon: const Icon(Icons.key_rounded),
                        label: Text(
                          "Password",
                          style: TextStyle(fontSize: mq.width * .04),
                        ),
                        hintText: "Enter Your Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isVisible) {
                                isVisible = false;
                                passIcon = const Icon(Icons.visibility);
                              } else {
                                isVisible = true;
                                passIcon = const Icon(Icons.visibility_off);
                              }
                            });
                          },
                          icon: passIcon,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(9.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: isSelected,
                                onChanged: (bool? newValue) {
                                  isSelected = newValue!;
                                  if (isSelected) {
                                    saveRememberMePreference(true);
                                  } else {
                                    saveRememberMePreference(false);
                                  }
                                  setState(() {});
                                }),
                            Text(
                              "Remember Me",
                              style: TextStyle(fontSize: mq.width * .05),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()));
                          },
                          child: const Text(
                            "Forgot Password ?",
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(11.0)),
                    ElevatedButton(
                      onPressed: () {
                        if (loginFormkey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen())))
                              .onError((error, stackTrace) {
                            setState(() {
                              _errorText = "Invalid Email or Password";
                              passwordController.clear();
                            });
                          });
                        }
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: mq.width * .04),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(11.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account ?",
                          style: TextStyle(fontSize: mq.width * .04),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.red, fontSize: mq.width * .05),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(11.0)),
                    Text(
                      _errorText,
                      style: TextStyle(
                          color: Colors.red, fontSize: mq.width * .05),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// To save the "Remember Me" preference
void saveRememberMePreference(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', value);
}

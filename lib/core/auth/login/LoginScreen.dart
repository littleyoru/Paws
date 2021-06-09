import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paws/core/auth/register/RegisterScreen.dart';

// theme
import '../../../config/themes/custom_theme.dart';

// models
import 'LoginForm.dart';

// actions
import 'loginActions.dart';

// widgets
import '../../../widgets/CustomAppBar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var formData = new LoginForm(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Log in',
        isLoggedIn: false,
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome!',
              style: headingStyle(),
            ),
            Container(
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      onSaved: (String? value) =>
                          {formData.email = value ?? ''},
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Email is invalid, must contain @';
                        }
                        if (!value.contains('.')) {
                          return 'Email is invalid, must contain .';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onSaved: (String? value) =>
                          {formData.password = value ?? ''},
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if the form is invalid
                          if (_formKey.currentState!.validate()) {
                            // Process data
                            _formKey.currentState?.save();
                            debugPrint('form data: $formData');
                            var data = formData.toJson();
                            debugPrint('form data: $data');
                            loginUser(data)
                                .then((res) => Navigator.pop(context))
                                .catchError(
                                    (err) => debugPrint('Error at login $err'));
                            // registerUser(formData)
                            //     .then((res) => {
                            //           log('response data: ${res.body}')
                            //           //Navigator.pop(context)
                            //         })
                            //     .catchError((err) => log('error from api $err'));
                          }
                        },
                        child: const Text('Log in'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Forgot password?',
              style: linkStyle(),
            ),
            RichText(
              text: TextSpan(
                style: infoStyle(),
                children: <TextSpan>[
                  TextSpan(text: 'Dont have an account? '),
                  TextSpan(
                    text: 'Sign up here',
                    style: linkStyle(),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
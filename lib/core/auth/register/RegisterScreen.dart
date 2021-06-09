import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';

// theme
import '../../../config/themes/custom_theme.dart';

// models
import 'RegisterForm.dart';

// actions
import 'registerActions.dart';

// widgets
import '../../../widgets/CustomAppBar.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var formData =
      new RegisterForm(name: '', email: '', password: '', repeatPass: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        isLoggedIn: false,
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Sign up',
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
                      onSaved: (String? value) => {formData.name = value ?? ''},
                      decoration: const InputDecoration(hintText: 'Full Name'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
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
                      height: 20.0,
                    ),
                    TextFormField(
                      onSaved: (String? value) =>
                          {formData.repeatPass = value ?? ''},
                      decoration:
                          const InputDecoration(hintText: 'Repeat password'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password again';
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
                    ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if the form is invalid
                        if (_formKey.currentState!.validate()) {
                          // Process data
                          _formKey.currentState?.save();
                          debugPrint('form data: $formData');
                          var data = formData.toJson();
                          debugPrint('form data: $data');
                          registerUser(data);
                          // registerUser(formData)
                          //     .then((res) => {
                          //           log('response data: ${res.body}')
                          //           //Navigator.pop(context)
                          //         })
                          //     .catchError((err) => log('error from api $err'));
                        }
                      },
                      child: const Text('Create account'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

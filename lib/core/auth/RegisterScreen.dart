import 'package:flutter/material.dart';

// widgets
import '../../widgets/CustomAppBar.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign up',
        isLoggedIn: false,
        showBackButton: true,
      ),
      body: Center(
        child: Text('Registration Screen'),
      ),
    );
  }
}

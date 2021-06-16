import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import '../../../config/themes/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:paws/state/user_repository.dart';
import '../../../widgets/CustomAppBar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
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
                'Account information',
                style: headingStyle(),
              ),
              Container(
                width: 300,
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if the form is invalid
                      final result = await user.logout();
                      if (result == true) {
                        debugPrint('logout successfull');
                      } else {
                        debugPrint('logout error');
                      }
                      // registerUser(formData)
                      //     .then((res) => {
                      //           log('response data: ${res.body}')
                      //           //Navigator.pop(context)
                      //         })
                      //     .catchError((err) => log('error from api $err'));
                    },
                    child: const Text('Logout'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

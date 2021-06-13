import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/helpers/color_helper.dart';
import '../core/auth/models/auth_view_model.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutButton({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    return authViewModel.logingOut()
        ? _inProgressButton()
        : _extendedButton(authViewModel);
  }

  IconButton _inProgressButton() {
    return IconButton(
      icon: Icon(Icons.rotate_right),
      onPressed: null,
    );
  }

  IconButton _extendedButton(AuthViewModel authViewModel) {
    return IconButton(
      onPressed: () async {
        await authViewModel.onLogoutTap();
        onLogout();
      },
      icon: Icon(
        Icons.settings,
        color: createMaterialColor(Color(0xFF38261F)),
      ),
    );
  }
}

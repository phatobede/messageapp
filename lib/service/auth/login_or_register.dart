import 'package:flutter/material.dart';
import 'package:message_app/page/login_page.dart';
import 'package:message_app/page/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void toogglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        ontap: toogglePages,
      );
    } else {
      return RegisterPage(
        ontap: toogglePages,
      );
    }
  }
}

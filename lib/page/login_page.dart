import 'package:flutter/material.dart';
import 'package:message_app/service/auth/auth_services.dart';
import 'package:message_app/component/my_button.dart';
import 'package:message_app/component/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? ontap;
  LoginPage({super.key, this.ontap});

  Future login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            'Wellcome back',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
            hintext: 'Email',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            obscuretext: false,
            controller: _emailController,
          ),
          MyTextfield(
            hintext: 'Password',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            obscuretext: true,
            controller: _pwController,
          ),
          MyButton(
            text: 'Login',
            onTap: () => login().catchError((e) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: ontap,
                child: const Text(
                  'Register now?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

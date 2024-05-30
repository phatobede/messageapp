import 'package:flutter/material.dart';
import 'package:message_app/service/auth/auth_services.dart';
import 'package:message_app/component/my_button.dart';
import 'package:message_app/component/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final void Function()? ontap;
  RegisterPage({super.key, this.ontap});
  void register(BuildContext context) {
    final auth = AuthService();
    if (_pwController.text == _confirmController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Password don`t match'),
          ),
        );
      }
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
            'Let`s create an acount for you',
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
          MyTextfield(
            hintext: 'Confirm Password',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            obscuretext: true,
            controller: _confirmController,
          ),
          MyButton(
            text: 'Register',
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an acount?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: ontap,
                child: const Text(
                  'Login now?',
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

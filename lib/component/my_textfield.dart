import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintext;
  final TextStyle style;
  final bool obscuretext;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTextfield(
      {super.key,
      required this.hintext,
      required this.style,
      required this.obscuretext,
      required this.controller,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        obscureText: obscuretext,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: style,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

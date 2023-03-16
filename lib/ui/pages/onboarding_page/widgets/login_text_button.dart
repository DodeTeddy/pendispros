import 'package:flutter/material.dart';

class LoginTextButton extends StatelessWidget {
  final Function() onTap;
  const LoginTextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120,
      child: Row(
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      )
    );
  }
}
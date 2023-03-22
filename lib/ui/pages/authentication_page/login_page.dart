import 'package:flutter/material.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_container.dart';
import '../../shared/widgets/custom_textformfield.dart';
import 'widgets/auth_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHide = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  scale: 8,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _usernameController,
                      onTap: () => null,
                      title: 'Username or password',
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      onTap: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      obscureText: true,
                      isHide: isHide,
                      title: 'Password',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                },
              ),
              const SizedBox(height: 15),
              AuthTextButton(
                text: 'Don\'t have an account?',
                textButton: 'Sign up',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/registration', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
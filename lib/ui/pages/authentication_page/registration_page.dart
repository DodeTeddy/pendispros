import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_container.dart';
import '../../shared/widgets/custom_textformfield.dart';
import 'widgets/auth_text_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHide = true;
  String? user = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/registration.png',
                  scale: 8,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'User category',
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                        const SizedBox(height: 5),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2,
                                color: secondaryColor
                              )
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2,
                                color: secondaryColor
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2,
                                color: primaryColor
                              )
                            ),
                          ),
                          iconEnabledColor: primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          items: const [
                            DropdownMenuItem(
                              value: 'disabilty',
                              child: Text('Disability'),
                            ),
                            DropdownMenuItem(
                              value: 'prosthetic',
                              child: Text('Prosthetic Workshop'),
                            )
                          ], 
                          onChanged: (value) {
                            user = value;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      onTap: () => null,
                      title: 'Username',
                    ),
                    CustomTextFormField(
                      onTap: () => null,
                      title: 'Email',
                    ),
                    CustomTextFormField(
                      onTap: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      isHide: isHide,
                      obscureText: true,
                      title: 'Password',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
              const SizedBox(height: 15),
              AuthTextButton(
                text: 'Already have an account?',
                textButton: 'Login',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
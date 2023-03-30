import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/models/sign_up_model.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_container.dart';
import '../../shared/widgets/custom_dropdown.dart';
import '../../shared/widgets/custom_textformfield.dart';
import 'widgets/auth_text_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHide = true;
  bool isLoading = false;
  final passSnackBar = const SnackBar(
    content: Text('Password must be at least 8 characters'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  final snackBar = const SnackBar(
    content: Text('Field cannot be empty'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  List category = ['disability', 'prosthetic'];
  String userCategory = 'disability';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void registration()async{
    late SignUpModel signUpModel;
    if (userCategory.isEmpty || _usernameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else if (userCategory.isNotEmpty && _usernameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(passSnackBar);
    }else{
      setState(() {
        isLoading = true;
      });
      signUpModel = await signUp(
        userCategory, 
        _usernameController.text, 
        _emailController.text, 
        _passwordController.text
      );
      if (signUpModel.message == 'Registration Success!') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isNotFirst', true);
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(signUpModel.message),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          )
        );
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }else if(signUpModel.message == 'Registration Failed!' && userCategory.isNotEmpty && _usernameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _passwordController.text.length >= 8){
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(signUpModel.message),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
    }
  }

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
                    CustomDropDown(
                      title: 'User Category', 
                      value: userCategory,
                      onChanged: (value) {
                        setState(() {
                          userCategory = value;
                        });
                      },
                      items: category.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value == 'disability' ? 'Disability' : 'Prosthetic'),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _usernameController,
                      onTap: () => null,
                      title: 'Username',
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      onTap: () => null,
                      title: 'Email',
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
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
                onTap: registration,
                isLoading: isLoading,
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
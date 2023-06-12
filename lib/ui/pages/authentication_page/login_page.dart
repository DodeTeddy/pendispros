import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/models/login_model.dart';
import 'package:tugas_akhir_app/services/service.dart';
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
  bool isLoading = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final snackBar = const SnackBar(
    content: Text('Kolom tidak boleh kosong'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  final passSnackBar = const SnackBar(
    content: Text('Nama pengguna atau kata sandi salah'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  void loginFunction() async {
    FocusScope.of(context).unfocus();
    late LoginModel loginModel;
    if (_passwordController.text.isEmpty || _usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_passwordController.text.isEmpty &&
        _usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_passwordController.text.length < 8 &&
        _usernameController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passSnackBar);
    } else {
      setState(() {
        isLoading = true;
      });
      loginModel =
          await login(_usernameController.text, _passwordController.text);
      if (loginModel.message == 'Login success!') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLogin', true);
        await prefs.setBool('isNotFirst', true);
        await prefs.setString('token', loginModel.token);
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else if (loginModel.message == 'Login Failed!') {
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(passSnackBar);
      }
    }
  }

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
                'Masuk',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _usernameController,
                      onTap: () => null,
                      title: 'Nama Pengguna',
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
                      title: 'Kata Sandi',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                title: 'Masuk',
                onTap: loginFunction,
                isLoading: isLoading,
              ),
              const SizedBox(height: 15),
              AuthTextButton(
                text: 'Belum punya akun?',
                textButton: 'Register',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/registration', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

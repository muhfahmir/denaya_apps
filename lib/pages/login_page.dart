// ignore_for_file: use_build_context_synchronously

import 'package:denaya_apps/components/denaya_text_form_field.dart';
import 'package:denaya_apps/components/loading.dart';
import 'package:denaya_apps/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../components/flushbar.dart';
import '../components/primary_button.dart';
import '../utils/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  late bool _isValidation = false;
  late bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Form(
                key: _loginFormKey,
                autovalidateMode: _isValidation ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text('Welcome !',
                        style: DenayaFonts(context).boldQuicksand(
                          size: 32,
                          color: DenayaColors.primary,
                        )),
                    Text(
                      'Login in to continue',
                      style: DenayaFonts(context).semiBoldQuicksand(size: 13, color: DenayaColors.black),
                    ),
                    const SizedBox(height: 60),
                    const Image(
                      image: AssetImage('assets/img/illustration_login.png'),
                    ),
                    const SizedBox(height: 30),
                    DenayaTextFormField(
                      noLabel: true,
                      controller: _usernameController,
                      hint: 'Username',
                      capitalization: TextCapitalization.none,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Username is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    DenayaTextFormField(
                      noLabel: true,
                      password: true,
                      suffix: true,
                      controller: _passwordController,
                      hint: 'Password',
                      capitalization: TextCapitalization.none,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Password is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      text: 'LOGIN',
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          _isValidation = true;
                        });
                        if (_loginFormKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed((const Duration(seconds: 1)), () {
                            setState(() {
                              _isLoading = false;
                            });
                          });

                          // ignore: unrelated_type_equality_checks
                          if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainPage()));
                          } else {
                            alert(context, text: 'Username dan Password salah', icon: Icons.error);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        LoadingScreen(loading: _isLoading),
      ],
    );
  }
}

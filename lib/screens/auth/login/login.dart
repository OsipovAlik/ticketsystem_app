import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/auth_provider/auth_provider.dart';
import 'package:ticketsystem/screens/auth/login/login_form.dart';
import 'package:ticketsystem/screens/auth/register/register.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/utils/restart_widget/restart_widget.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isError = false;

  Future<void> login() async {
    final authUser = Provider.of<AuthProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      Map<String, String> body = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      String bodyJson = jsonEncode(body);
      authUser.login(context, bodyJson);
    } else {
      SnackbarUtil.showSnackbar(context, S.current.blank,
          duration: Duration(milliseconds: 500));
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

// _formKey.currentState!.validate()
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueBold,
      appBar: AppBar(
        backgroundColor: CustomColors.blueBold,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_new), // Change the icon here
          onPressed: () {
            guestUser = true;
             RestartWidget.restartApp(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          color: CustomColors.blueBold,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Image.asset("lib/assets/images/card.jpeg"),
              Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'lib/assets/images/logo.png',
                          width: MediaQuery.sizeOf(context).width / 2.5,
                        ),
                      ),
                      const SizedBox(height: 68),
                      Center(
                          child: Text(
                        S.current.hello,
                        style: ThemeText.c22b,
                      )),
                      Center(
                          child: Text(
                        "WELCOME BACK",
                        style: ThemeText.w20b,
                      )),
                      const SizedBox(height: 68),
                      Text(S.current.sign_in, style: ThemeText.g22b),
                      const SizedBox(height: 16),
                      LoginForm(
                          focusNode: FocusNode(),
                          toggle: _toggle,
                          obscureText: _obscureText,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          formKey: _formKey,
                          isError: isError),
                      SizedBox(height: 20),
                      _nextButton(),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(S.current.dont_have_acount,
                              style: ThemeText.w14b),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child:
                                Text(S.current.register, style: ThemeText.c14b,maxLines: 1,overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        )),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: MyBoxDecoration.ticketButton,
      child: Selector<AuthProvider, bool>(
        selector: (_, provider) => provider.isLoading,
        builder: (_, isLoading, __) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Make button transparent
              shadowColor: Colors.transparent, // Remove shadow
            ),
            child: isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      backgroundColor: CustomColors.blueBold,
                      color: CustomColors.cyan,
                    ),
                  )
                : Text(S.current.sign_in, style: ThemeText.w16),
            onPressed: () {
              login();
            },
          );
        },
      ),
    );
  }
}

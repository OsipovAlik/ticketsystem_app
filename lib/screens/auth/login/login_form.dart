import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/providers/auth_provider/auth_provider.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import '../../../theme/custom_colors.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final FocusNode focusNode;
  final bool obscureText;
  final Function toggle;
  final bool isError;
  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.focusNode,
      required this.obscureText,
      required this.toggle,
      required this.isError});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return _loginForm(context, provider);
    });
  }

  Widget _loginForm(BuildContext context, AuthProvider provider) {
    return Form(
        key: formKey,
        child: Column(spacing: 22, children: <Widget>[
          TextFormField(
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              enableInteractiveSelection: false,
              controller: emailController,
              cursorColor: Colors.white,
              autofillHints: [AutofillHints.email],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ""; // Localization for 'Email is required'
                } else if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                    .hasMatch(value)) {
                  return ""; // Localization for 'Invalid email'
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: CustomColors.inputBlue.withOpacity(0.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  borderSide: BorderSide.none, // No visible border
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border for focused state
                ),
                hintText: S.current.email,
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: ThemeText.g14,
              )),
          TextFormField(
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              enableInteractiveSelection: false,
              controller: passwordController,
              cursorColor: Colors.white,
              obscureText: obscureText,
              // focusNode: focusNode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ""; // Localization for 'Password is required'
                }
                return null;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    color: Colors.grey,
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => toggle()),
                fillColor: CustomColors.inputBlue.withOpacity(0.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0), // Rounded corners
                  borderSide: BorderSide.none, // No visible border
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border for focused state
                ),
                hintText: S.current.password,
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: ThemeText.g14,
              )),
        ]));
  }
}

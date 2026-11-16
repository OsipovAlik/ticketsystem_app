import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/providers/auth_provider/auth_provider.dart';
import 'package:ticketsystem/screens/auth/login/login.dart';
import 'package:ticketsystem/screens/auth/register/form_email_pass.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import 'form_phone_name.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKeyPhoneName = GlobalKey<FormState>();
  //  final _formKeyEmailPass = GlobalKey<FormState>();
  bool _obscureText = false;
  bool _isError = false;
  bool _next = false;

  Future<void> register() async {
    final authUser = Provider.of<AuthProvider>(context, listen: false);
    if (_formKeyPhoneName.currentState!.validate() && _nameController.text.isNotEmpty) {
      Map<String, String> body = {
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone': _phoneController.text,
        "name": _nameController.text
      };

      String bodyJson = jsonEncode(body);
      authUser.register(context, bodyJson);
    } else {
      SnackbarUtil.showSnackbar(context, S.current.blank,
          duration: Duration(milliseconds: 500));
    }
  }
  void _nextPage() {
    if(_formKeyPhoneName.currentState!.validate() 
    && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
       setState(() {
        _next = !_next;
      });
    }else{
      SnackbarUtil.showSnackbar(context, S.current.blank,
          duration: Duration(milliseconds: 500));
    }
    
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
    void _validator() {
    setState(() {
      _isError = true;
    });
  }
    void _onChange() {
    setState(() {
      _isError = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
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
              if(_next){
                setState(() {
                  _next = !_next;
                });
              }else{
                Navigator.of(context).pop();
              }
              
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<AuthProvider>(
              builder: (BuildContext context,AuthProvider provider,Widget? child) {
              return Stack(
              children: [
                Image.asset("lib/assets/images/card.jpeg"),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'lib/assets/images/logo.webp',
                          width: MediaQuery.sizeOf(context).width / 2.5,
                        ),
                      ),
                      const SizedBox(height: 68),
                  
                      Center(
                          child: Text(
                        "Welcome",
                        style: ThemeText.c22,
                      )),
                      const SizedBox(height: 38),
                      Text(S.current.register, style: ThemeText.g22b),
                      const SizedBox(height: 16),
                     _next? 
                      FormPhoneName(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        formKey: _formKeyPhoneName,
                        validator: _validator,
                        onChange: _onChange,
                        isError: _isError):
                        FormEmailPass(
                          passwordController: _passwordController,
                          emailController: _emailController,
                          toggle: _toggle,
                          obscureText: _obscureText,
                          formKey: _formKeyPhoneName,
                          isError: _isError),
                  SizedBox(height: 28),
                  _nextButton(),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(S.current.sign_in_your_account,
                          style: ThemeText.w14b),
                      InkWell(
                        onTap: () {
                           Navigator.of(context, rootNavigator: true).pushReplacement(
                             MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child:
                            Text(S.current.sign_in, style: ThemeText.c14b),
                      ),
                    ],
                  )
                    ],
                  ),
                )
              ],
            );
            },)
          ),
        ));
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
                : Text(_next? S.current.register:S.current.next , style: ThemeText.w16),
            onPressed: () {
              if(_next){
                 register();
              }else{
                _nextPage();
              }     
            },
          );
          
        },
      ),
    );
  }
}

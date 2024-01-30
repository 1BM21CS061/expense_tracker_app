// ignore_for_file: camel_case_types, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/dashboard.dart';
import 'package:myapp/page-1/homepage-1.dart';
import 'package:myapp/services/auth/auth_service.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final AuthService _auth = AuthService();

  void signup() async {
    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await _auth.signUpWithEmailAndPassword(
            _usernameController.text, _passwordController.text,
        );
        Navigator.pop(context
        );
      } else {
        // Passwords do not match
        print("Passwords do not match");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SingleChildScrollView(
      child: Material(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(21.25 * fem, 46.25 * fem, 35 * fem, 156 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff020202),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIconButton(fem),
                  _buildHeaderText(ffem, fem),
                  _buildInputField('Username', _usernameController, Icons.person, fem),
                  _buildInputField('Password', _passwordController, Icons.lock, fem, obscureText: true),
                  _buildInputField('Confirm Password', _confirmPasswordController, Icons.lock, fem, obscureText: true),
                  _buildsignupButton(fem),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(double fem) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 265.83 * fem, 62.28 * fem),
      width: 37.92 * fem,
      height: 32.48 * fem,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24 * fem),
          ),
        ),
        child: Image.asset(
          'assets/page-1/images/arrow-small-left-1-KKS.png',
          width: 37.92 * fem,
          height: 32.48 * fem,
        ),
      ),
    );
  }

  Widget _buildHeaderText(double ffem, double fem) {
    return Container(
      margin: EdgeInsets.fromLTRB(13.75 * fem, 0 * fem, 0 * fem, 23 * fem),
      constraints: BoxConstraints(
        maxWidth: 194 * fem,
      ),
      child: Text(
        'USER\nSIGN UP',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 48 * ffem,
          fontWeight: FontWeight.w800,
          height: 1.2125 * ffem / fem,
          color: Color(0xffbb8cfc),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, IconData icon, double fem,
      {bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.75 * fem, 0 * fem, 12.75 * fem, 24 * fem),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontFamily: 'Saira',
          fontSize: 24 * fem,
          fontWeight: FontWeight.w400,
          height: 0.9166666667 * fem,
          letterSpacing: -0.96 * fem,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14 * fem,
            fontWeight: FontWeight.w300,
            height: 1.2125 * fem,
            color: Color(0xff000000),
          ),
          fillColor: Color(0x59ffffff),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20 * fem, 13 * fem, 20 * fem, 13 * fem),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12 * fem),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12 * fem),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 22 * fem,
          ),
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildsignupButton(double fem) {
    return Container(
      margin: EdgeInsets.fromLTRB(44.75 * fem, 0 * fem, 27 * fem, 0 * fem),
      width: double.infinity,
      height: 47 * fem,
      decoration: BoxDecoration(
        color: Color(0xffbb8cfc),
        borderRadius: BorderRadius.circular(20 * fem),
      ),
      child: TextButton(
        onPressed: signup,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24 * fem),
          ),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24 * fem,
              fontWeight: FontWeight.w800,
              height: 1.2125 * fem,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}

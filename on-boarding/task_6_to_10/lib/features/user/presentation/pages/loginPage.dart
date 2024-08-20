import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/features/product/presentation/pages/HomePage.dart';
import 'package:task_6/features/user/presentation/bloc/user_bloc.dart';
import 'package:task_6/features/user/presentation/bloc/user_event.dart';
import 'package:task_6/features/user/presentation/bloc/user_state.dart';
import 'signupPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  // Declare the variables here
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 1),
                height: 70,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(63, 81, 243, 1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'ECOM',
                    style: GoogleFonts.caveatBrush(
                      textStyle: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(63, 81, 243, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: Text(
                  "Sign into your account",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(111, 111, 111, 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ex: jon.smith@email.com',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(111, 111, 111, 1),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 20),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(111, 111, 111, 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '*********',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(111, 111, 111, 1),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 20),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: BlocConsumer<UserBloc, UserState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is UserLoginSuccess) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          } else if (state is UserError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                duration: const Duration(seconds: 4),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(63, 81, 243, 1),
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              side: const BorderSide(
                                color: Color.fromRGBO(63, 81, 243, 1),
                                width: 1.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(UserLoginRequested(email, password));
                              // Handle login logic here using email and password
                              print('Email: $email, Password: $password');
                            },
                            child: state is UserLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text('SIGN IN',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Signuppage(),
                              ),
                            );
                          },
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(63, 81, 243, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

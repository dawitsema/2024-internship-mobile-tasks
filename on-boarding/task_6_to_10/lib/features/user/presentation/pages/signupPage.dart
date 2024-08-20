import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/features/user/presentation/bloc/user_bloc.dart';
import 'package:task_6/features/user/presentation/bloc/user_event.dart';
import 'package:task_6/features/user/presentation/bloc/user_state.dart';
import 'package:task_6/features/user/presentation/pages/loginPage.dart';

import '../widgets/common_widget.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  String email = '';
  String password = '';
  String name = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color.fromRGBO(63, 81, 243, 1),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color.fromRGBO(63, 81, 243, 1),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'ECOM',
                        style: GoogleFonts.caveatBrush(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(63, 81, 243, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Create your account",
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
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
                          hintText: 'ex: jon smith',
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
                            name = value;
                          });
                        },
                      ),
                    ),
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
                          hintText: "ex: jon.smith@email.com",
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
                          hintText: "********",
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
                            password = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Confirm Password",
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
                          hintText: "*********",
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
                            confirmPassword = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyCheckbox(),
                        Text(
                          "I understood the",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'terms & policy',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(63, 81, 243, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocConsumer<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is UserInitial) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
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
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(63, 81, 243, 1),
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              side: const BorderSide(
                                  color: Color.fromRGBO(63, 81, 243, 1),
                                  width: 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context).add(
                                  UserRegisterRequested(name, email, password));
                              //handle the signup event here
                              print('Email: $email, Password: $password');
                            },
                            child: Center(
                              child: state is UserLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'SIGN UP',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Row(
                        children: [
                          Text(
                            "Have an account? ",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(63, 81, 243, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
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

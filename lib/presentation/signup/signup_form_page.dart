import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratch_recipe_app/presentation/themes.dart';

class SignupFormPage extends StatelessWidget {
  const SignupFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/signup/welcome_spoon.png'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 25, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Please login to continue', style: TextStyle(color: Color(0xFF606060), fontSize: 16),),
                    SizedBox(height: 50,),
                    Text('Email address', style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 16),),
                    TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: primaryColor),
                          ),
                        )
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Password', style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 16),),
                        Text('Forgot password?', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    TextFormField(obscureText: true, decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor),),)),
                    SizedBox(height: 35,),
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(primaryColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                        ),
                        child: Text('Login', style: TextStyle(fontSize: 18),)
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color(0xFF2C66B6)),
                        onPressed: () {
                          // context.read<SignInFormCubit>().signInWithFacebook();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset('assets/facebook_logo.png'),
                              SizedBox(width: 20,),
                              Text('Continue with Facebook', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('New to Scratch?', style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 16),),
                        SizedBox(height: 10,),
                        Text('Create Account Here', style: TextStyle(color: primaryColor, fontSize: 20),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

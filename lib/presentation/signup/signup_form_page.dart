import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:scratch_recipe_app/application/signup/signup_form_cubit.dart';
import 'package:scratch_recipe_app/navigator_utils.dart';
import 'package:scratch_recipe_app/presentation/profile/profile_overview_page.dart';
import 'package:scratch_recipe_app/presentation/themes.dart';

class SignupFormPage extends StatelessWidget {
  SignupFormPage({Key? key}) : super(key: key);

  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupFormCubit(context.read<FacebookAuth>())..initial(),
      child: BlocConsumer<SignupFormCubit, SignupFormState>(
      listener: (BuildContext context, SignupFormState state) {

      },
      builder: (BuildContext context, SignupFormState state) {
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
                            controller: emailTextEditingController,
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
                          TextFormField(controller: passwordTextEditingController, obscureText: true, decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor),),)),
                          SizedBox(height: 35,),
                          Container(
                            height: 60,
                            child: ElevatedButton(
                                onPressed: () {
                                  String message = context.read<SignupFormCubit>().login(emailTextEditingController.text, passwordTextEditingController.text);
                                  if(message == "") {
                                    pushToPage(context, ProfileOverviewPage());
                                  } else {
                                    _showDialog(context, message);
                                  }
                                },
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
                              onPressed: () async {
                                String message = await context.read<SignupFormCubit>().loginWithFacebook();
                                if(message == "") {
                                  pushToPage(context, ProfileOverviewPage());
                                } else {
                                  _showDialog(context, message);
                                }
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Image.asset('assets/facebook_logo.png'),
                                    SizedBox(width: 20,),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText('Continue with Facebook', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('to Scratch?', style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 16),),
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
      ));
  }

  _showDialog(BuildContext context, String message) async {
    await showDialog<String>(
      context: context,
        builder: (BuildContext context) {  
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: Row(
              children: <Widget>[
                Expanded(
                  child: Text(message),
                ),
              ],
            ),
            actions: <Widget>[
            ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ],
          );
        }
    );
  }
}

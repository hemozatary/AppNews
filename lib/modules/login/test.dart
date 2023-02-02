

import 'package:firas/shared/components/components.dart';
import 'package:flutter/material.dart';



class LoginScreen  extends StatefulWidget
{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailControler = TextEditingController();
var passwordControler = TextEditingController();
var formKey = GlobalKey <FormState>();
bool ispassword = true;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: SingleChildScrollView(
              child: Form(
           key: formKey ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFromField(
                      controller: emailControler,
                      label: 'Email Address',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      onChange: (value)
                      {
                        print(value);
                      },

                      onSubmit: (value)
                      {
                        print(value);
                      },

                      validator: (String?  value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'email must not be empty';
                        }
                        return null;
                      },

                    ),


                    SizedBox(
                      height: 20.0,
                    ),

                      defaultFromField(
                     controller: passwordControler,
                     label: 'Password',
                      prefix: Icons.lock,
                      isPassword:ispassword,
                      suffixpressed: ()
                      {
                       setState(() {
                         ispassword = !ispassword;

                       });
                      },
                      suffix:ispassword? Icons.visibility :Icons.visibility_off,
                      type: TextInputType.visiblePassword,
                     onChange: (value)
                     {
                     print(value);
                     },

                     onSubmit: (value)
                     {
                      print(value);
                     },

                   validator: (String?  value)
                     {
                   if(value!.isEmpty)
                   {
                      return 'password must not be empty';
                    }
                     return null;
                     },

                      ),
                    SizedBox(
                      height: 20.0,
                    ),

                 defaultButton(
                     text: 'login',
                    radios: 10.0,
                    isUpparCase: false,
                   function: () {
                     if (formKey.currentState!.validate()) {
                       print(emailControler.text);
                       print(passwordControler.text);
                     }
                   }
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account'
                        ),
                        TextButton(
                            onPressed:(){},
                            child:Text(
                              'Register Now'
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
     ),
    );

  }
}

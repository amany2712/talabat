import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talabat/screens/app_navigation_bar.dart';
import 'package:talabat/screens/register_screen.dart';
import 'package:talabat/text_form_field_class.dart';

class LoginScreen extends StatelessWidget {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.png"),

              SizedBox(height: 32,),

              TextFormFieldClass(
                controller: emailController,
                labelText: "Email",
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 16,),
              TextFormFieldClass(
                controller: passwordController,
                labelText: "Password",
                prefixIcon: Icons.lock,
              ),

              SizedBox(height: 32,),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text("LogIn",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF55540),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                
                ),
              ),

              SizedBox(height: 16,),

              Divider(
                radius: BorderRadius.circular(10),
                color: Colors.grey,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),

              SizedBox(height: 8,),

              Text("Or Login With ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold

                ),),

                SizedBox(height: 8,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Image.asset("assets/images/authflow 4.png"),
                    Image.asset("assets/images/authflow 3.png"),
                  ],
                ),

                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New user? Register  ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            )
                          );
                        },
                        child: Text("here",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFF55540),
                        ),),
                      ),
                  ],
                )




            ],
          ),
        ),
      ),
    );
  }

  Future loginUser (BuildContext context) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email:emailController.text.trim(), 
    password: passwordController.text.trim(),
  );

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => AppNavigationBar(),)
      , (route) => false
    );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

}
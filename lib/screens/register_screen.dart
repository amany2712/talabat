import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talabat/screens/app_navigation_bar.dart';
import 'package:talabat/screens/login_screen.dart';
import 'package:talabat/text_form_field_class.dart';

class RegisterScreen extends StatelessWidget {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/register.png"),

              SizedBox(height: 32,),

              TextFormFieldClass(
                controller: nameController,
                labelText: "Name",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 16,),

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
              SizedBox(height: 16,),
              TextFormFieldClass(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                prefixIcon: Icons.lock,
              ),

              SizedBox(height: 32,),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    registerUser(context);
                  },
                  child: Text("Register",
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

              Text("Or register With ",
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
                    Text("Already have an account? Login ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
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

  Future registerUser (BuildContext context) async {
    if(passwordController.text.trim() != confirmPasswordController.text.trim()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match"),
        backgroundColor: Colors.red,)
      );
    }

    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );

  //add user info to firestore
  final user = credential.user;
  if(user!=null){
    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "email": user.email,
      "name": nameController.text.trim(),
      "password": passwordController.text.trim(),

    },SetOptions(merge: true));

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => AppNavigationBar(),)
      , (route) => false
    );

  }


} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

  }
}
import 'package:devathon_project/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.ontap});
  final Function()? ontap;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final cpasscontroller = TextEditingController();

  void signIn() async {
    String email = emailcontroller.text.trim();
    String pass = passcontroller.text.trim();
    String cpass = cpasscontroller.text.trim();

    showDialog(
        context: context,
        builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )));

    if (pass != cpass) {
      Navigator.pop(context);
      var snackbar = const SnackBar(content: Text("Passwords do not match!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      var snackbar = SnackBar(content: Text(e.code));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/Login.svg"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Registration",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 29,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Your Name",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextfield(
                  hintText: "Email",
                  obsecureText: false,
                  controller: emailcontroller,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextfield(
                  hintText: "Password",
                  obsecureText: true,
                  controller: passcontroller,
                  icon: const Icon(Icons.remove_red_eye),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextfield(
                  hintText: "Confirm Password",
                  obsecureText: true,
                  controller: cpasscontroller,
                  icon: const Icon(Icons.remove_red_eye),
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                  text: "Sign In",
                  ontap: signIn,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                      child: Text(
                        " Login!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

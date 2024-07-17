import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/presentation/screen/login_screen.dart';

// ...............................................

class ForgotPasswdScreen  extends StatefulWidget {
  const ForgotPasswdScreen({super.key});

  @override
  State<ForgotPasswdScreen> createState() => _ForgotPasswdScreenState();
}


class _ForgotPasswdScreenState extends State<ForgotPasswdScreen> {

  TextEditingController emailController = TextEditingController();

  Future<void> sendEmail() async {
    try {
      // Enviar el email de reseteo de la contraseña desde Firebase
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);

      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen(),
          ),
      );

    } catch (e) {
      debugPrint('Error: $e');
    }
  }


// .............    .............

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.appTitle, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: screenHeight * 0.1),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    AppTag.recuperarPassword,
                    style: TextStyle(
                        color:  AppTag.appBarColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppTag.userName,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: sendEmail,
                    child: const Text(AppTag.recuperarButton),
                  )
              ),
            ],
          )),
    );
  }

}  // Fin de la clase

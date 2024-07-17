import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/presentation/screen/home_screen.dart';
import 'package:second_blood/presentation/screen/forgot_passwd_screen.dart';

// ...............................................
// Login en Flutter y Firebase: https://firebase.google.com/docs/auth/flutter/manage-users
// .............    .............

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // .......................     .......................

  Future<void> getServerUrl() async {
    try {
      // Obtener la URL del servidor desde Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('restAPI').doc('server').get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        String? url = data['url'];
        String? endpoint = data['endpoint'];
        //Api.serverUrl = '$url$endpoint';

      } else {
        debugPrint('No se encontró la URL del servidor.');
      }
    } catch (e) {
      debugPrint('Error: $e');   // Mostrar el error producido
    }
  }


  // .......................     .......................

  Future<void> login() async {
    try {
      // Autenticar al usuario con Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: nameController.text,
          password: passwordController.text,
      );

      // Obtener el ID de usuario
      String uid = userCredential.user!.uid;

      // Obtener la clave externa desde Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        String? externalKey = data['externalKey'];

        Api.authorizationBearerKey = externalKey!;
        getServerUrl();

        Navigator.push(
            // ignore: use_build_context_synchronously
            context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                ),
        );

      } else {
        debugPrint('No se encontró la clave externa para este usuario.');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  // .......................     .......................

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
                    AppTag.initSesion,
                    style: TextStyle(
                        color:  AppTag.appBarColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppTag.userName,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppTag.password,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child:
                TextButton(
                  child: const Text(AppTag.forgotPassword),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswdScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text(AppTag.accessButton),
                  )
              ),
            ],
          )),
    );
  }

}  // Fin de la clase

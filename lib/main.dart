import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:second_blood/firebase_options.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/presentation/screen/login_screen.dart';

// ...............................................

Future<void> main() async {
  // Inicializar la aplicación enlazándola con Firebase (para la autenticación)
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Se inicializa FIREBASE con los parámetros generados automáticamente durante el proceso de configuración (de FIREBASE)
    // Se ha seguido los pasos descritos en https://firebase.google.com/docs/flutter/setup?platform=android
    // El fichero de configuración 'package:second_blood/firebase_options.dart' enlaza con el projecto creado en FIREBASE.
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ejecutar la clase que contiene la APP de Flutter
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,    
      title: AppTag.appTitle,  // Título de la aplicación
      // Datos de configuración de la apariencia de la APP (colores de los principales componentes)
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color:AppTag.appBarColor,
            iconTheme: IconThemeData(color: Colors.white)
        ),
        scaffoldBackgroundColor: AppTag.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppTag.buttonColor),
        useMaterial3: true,
      ),
      // Se muestra la página del LOGIN cuando se carga la APP
      home: const LoginScreen(),
    );
  }
}

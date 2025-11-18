import 'package:album_biblio/views/PaginaLogin.dart';
import 'package:flutter/material.dart';
import 'views/album_lista.dart';
import 'package:provider/provider.dart';
import 'package:album_biblio/model/album_biblio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:album_biblio/firebase_options.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: DefaultFirebaseOptions.currentPlatform.appId),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo firebase_auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaginaLogin(),
    );
  }
  
}

import 'package:flutter/material.dart';
import 'views/album_lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Album DEMO',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: AlbumLista(),
    );
  }
}

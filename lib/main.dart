import 'package:flutter/material.dart';
import 'views/album_lista.dart';
import 'package:provider/provider.dart';
import 'package:album_biblio/model/album_biblio.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AlbumBiblio(), child: const MyApp()),
  );
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

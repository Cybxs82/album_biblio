import 'package:album_biblio/model/album_biblio.dart';
import 'package:flutter/material.dart';

// Jesus Leonardo Dominguez Pazos

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSelect = 0;
  late AlbumBiblio albumes;

  @override
  void initState() {
    super.initState();
    albumes = AlbumBiblio();
    albumes.addAlbum(
      Album(
        titulo: "Yurushite",
        artista: "t+Pazolite",
        anio: 2022,
        gender: "Electronica",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "Third Sanctuary",
        artista: "Toby fox",
        anio: 2025,
        gender: "Electronica",
      ),
    );
    albumes.addAlbum(
      Album(
        titulo: "The resistance",
        artista: "Skillet",
        anio: 2018,
        gender: "Rock",
      ),
    );
    albumes.addAlbum(
      Album(titulo: "Monster", artista: "Skillet", anio: 2022, gender: "Rock"),
    );
    albumes.addAlbum(
      Album(
        titulo: "Hopes and dreams",
        artista: "Toby fox",
        anio: 2011,
        gender: "Electronica",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
          "Lista de Álbumes Musicales",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 132, 31, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 4,
      ),
      body: RefreshIndicator(
        displacement: 30,
        edgeOffset: 15,
        color: Color.fromRGBO(255, 132, 31, 1),
        onRefresh: Actualizar,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: nuevaLista(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 132, 31, 1),
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> Actualizar() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {});
  }

  List<Widget> nuevaLista() {
    final List<Widget> lista = <Widget>[];
    for (int i = 0; i < albumes.albumes.length; i++) {
      Album album = albumes.albumes[i];
      lista.add(
        Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFFF841F), width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(Icons.album, color: Color(0xFFFF841F)),
            title: Text(
              album.titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${album.artista}, Género: ${album.gender}, Año: ${album.anio}",
              style: const TextStyle(color: Colors.black54),
            ),
            trailing: crearButtonsBar(i),
            selected: (albumSelect == i),
            selectedTileColor: const Color(0xFFFFF0E0),
            onTap: () => albumTapped(i),
          ),
        ),
      );
    }
    return lista;
  }

  void albumTapped(int i) {
    setState(() {
      albumSelect = i;
    });
  }

  Widget crearButtonsBar(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.search),
          color: Color.fromRGBO(255, 132, 31, 1),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          color: Color.fromRGBO(255, 132, 31, 1),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          color: Color.fromRGBO(255, 132, 31, 1),
          onPressed: () {},
        ),
      ],
    );
  }
}

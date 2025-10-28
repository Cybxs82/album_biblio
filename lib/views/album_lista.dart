import 'package:flutter/material.dart';
import 'package:album_biblio/model/album_biblio.dart' as model;
import 'package:album_biblio/views/album.dart';
import 'package:album_biblio/views/album_vista.dart';
import 'perfil_usuario.dart';

// Jesus Leonardo Dominguez Pazos /Practica 3

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSelect = 0;
  late model.AlbumBiblio albumes;

Genre stringToGenre(String genreString) {
  try{
    return Genre.values.byName(genreString);
  }catch(e) {
    return Genre.undefined;
  }
}

  @override
  void initState() {
    super.initState();
    albumes = model.AlbumBiblio();
    albumes.addAlbum(
      model.Album(
        titulo: "Yurushite",
        artista: "t+Pazolite",
        anio: 2022,
        gender: Genre.rock.name,
      ),
    );
    albumes.addAlbum(
      model.Album(
        titulo: "Third Sanctuary",
        artista: "Toby fox",
        anio: 2025,
        gender: Genre.electronica.name,
      ),
    );
    albumes.addAlbum(
      model.Album(
        titulo: "The resistance",
        artista: "Skillet",
        anio: 2018,
        gender: Genre.rock.name,
      ),
    );
    albumes.addAlbum(
      model.Album(
        titulo: "Monster",
        artista: "Skillet",
        anio: 2022,
        gender: Genre.rock.name,
      ),
    );
    albumes.addAlbum(
      model.Album(
        titulo: "Hopes and dreams",
        artista: "Toby fox",
        anio: 2011,
        gender: Genre.electronica.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
          "Lista de Álbumes Musicales",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(value: 1, child: Text("Perfíl del usuario")),
              const PopupMenuItem(value: 2, child: Text("Acerca de ...")),
            ],
            onSelected: (value) {
              setState(() {
                if (value == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PerfilUsuario(),
                    ),
                  );
                } else if (value == 2) {}
              });
            },
          ),
        ],

        backgroundColor: const Color.fromRGBO(255, 132, 31, 1),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: RefreshIndicator(
        displacement: 30,
        edgeOffset: 15,
        color: const Color.fromRGBO(255, 132, 31, 1),
        onRefresh: Actualizar,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: nuevaLista(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 132, 31, 1),
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
      model.Album album = albumes.albumes[i]; // <- usar alias aquí
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
          tooltip: "Ver",
          icon: const Icon(Icons.search),
          color: const Color(0xFFFF841F),
          onPressed: () {
            mostrarAlbum(context, index);
          },
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          color: const Color(0xFFFF841F),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          color: const Color(0xFFFF841F),
          onPressed: () {},
        ),
      ],
    );
  }

  void mostrarAlbum(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumVista(album: albumes.getAlbumByIndex(index)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:album_biblio/model/album_biblio.dart' as model;
import 'package:album_biblio/views/album.dart';
import 'package:album_biblio/views/album_vista.dart';
import 'perfil_usuario.dart';
import 'album_form.dart';
import 'package:provider/provider.dart';

// Jesus Leonardo Dominguez Pazos /Practica

class AlbumLista extends StatefulWidget {
  const AlbumLista({super.key});

  @override
  State<AlbumLista> createState() => _AlbumListaState();
}

class _AlbumListaState extends State<AlbumLista> {
  int albumSelect = 0;
  late model.AlbumBiblio albumes;

  Genre stringToGenre(String genreString) {
    try {
      return Genre.values.byName(genreString);
    } catch (e) {
      return Genre.undefined;
    }
  }

  @override
  Widget build(BuildContext context) {
    albumes = Provider.of<model.AlbumBiblio>(context);
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
                    MaterialPageRoute(builder: (context) => PerfilUsuario()),
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
      body: (albumes.albumes.isNotEmpty)
          ? ListView(
              padding: const EdgeInsets.all(10),
              children: ListTile.divideTiles(
                context: context,
                tiles: nuevaLista(),
                color: Colors.amber,
              ).toList(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    capturarAlbum(context);
                  },
                  child: const Text("Agregar Album"),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          capturarAlbum(context);
        },
        tooltip: 'Nuevo album',
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
      Album album = albumes.albumes[i]; // <- usar alias aquí
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
              "${album.artista}, Género: ${album.genre}, Año: ${album.anio}",
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
        IconButton(
          tooltip: "Editar",
          onPressed: () {
            actualizarAlbum(context, index);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          tooltip: "Eliminar",
          onPressed: () {
            removerAlbum(index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  Future<void> capturarAlbum(BuildContext context) async {
    final Album? album = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AlbumForm()),
    );
    if (album != null) {
      albumes.addAlbum(album);
    }
  }

  void mostrarAlbum(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumVista(album: albumes.getAlbumByIndex(index)),
      ),
    );
  }

  Future<void> actualizarAlbum(BuildContext context, int index) async {
    Album? album = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumForm(album: albumes.getAlbumByIndex(index)),
      ),
    );

    if (album != null) {
      albumes.updateAlbum(index, album);
    }
  }

  bool removerAlbum(int index) {
    return albumes.removeAlbum(index);
  }
}

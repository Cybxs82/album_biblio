import 'package:flutter/material.dart';
import 'package:album_biblio/model/album_biblio.dart'; 

class AlbumVista extends StatelessWidget {
  final Album album; 

  const AlbumVista({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Datos del Álbum",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF841F),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFFF841F), width: 1.5),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0E0),
                    border: Border.all(
                      color: const Color(0xFFFF841F),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.album,
                      size: 80,
                      color: Color(0xFFFF841F),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                infoRow(titulo: "Título: ", valor: album.titulo, italic: true),
                infoRow(titulo: "Cantante: ", valor: album.artista),
                infoRow(
                  titulo: "Año de lanzamiento: ",
                  valor: album.anio.toString(),
                ),
                infoRow(titulo: "Género: ", valor: album.gender),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF841F),
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget infoRow({
    required String titulo,
    required String valor,
    bool italic = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0E0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFFF841F),
            ),
          ),
          Expanded(
            child: Text(
              valor,
              style: TextStyle(
                fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

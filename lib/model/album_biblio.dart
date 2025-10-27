class AlbumBiblio {
  final List<Album> _listaAlbumes = [];
  AlbumBiblio();
  List<Album> get albumes => _listaAlbumes;
  void addAlbum(Album album) {
    _listaAlbumes.add(album);
  }
}

class Album {
  String? id;
  String titulo;
  String artista;
  int anio;
  String gender;
  Album({
    this.id,
    required this.titulo,
    required this.artista,
    required this.anio,
    required this.gender,
  });
}

enum Genre {
  pop,
  latin,
  rock,
  classic,
  hiphop,
  rap,
  metal,
  jazz,
  electronica,
  reageton,
  undefined,
}

Map genres = {
  Genre.pop: "Pop",
  Genre.electronica: "Electronica",
  Genre.classic: "Música clásica",
  Genre.hiphop: "Hip hop",
  Genre.jazz: "Jazz",
  Genre.latin: "Música latina",
  Genre.metal: "Rock-Metal",
  Genre.rap: "Rap",
  Genre.reageton: "Reageton",
  Genre.rock: "Rock",
  Genre.undefined: "No definido",
};

class Album {
  String? id;
  String titulo;
  String artista;
  int anio;
  Genre genre;
  Album({
    this.id,
    required this.titulo,
    required this.artista,
    required this.anio,
    required this.genre,
  });
  Album.vacio({
    this.id = "0",
    this.titulo = "",
    this.artista = "",
    this.anio = 0,
    this.genre = Genre.undefined,
  });
  String get genero => genres[genre];
  @override
  String toString() {
    return "Album{id: $id, titulo: $titulo, artista, $artista, anio: $anio, gender:${genre.name}}";
  }
}

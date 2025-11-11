import 'package:flutter/material.dart';
import 'package:album_biblio/views/album.dart';

class AlbumForm extends StatefulWidget {
  final Album? album;
  const AlbumForm({super.key, this.album});
  @override
  State<AlbumForm> createState() => _AlbumFormState();
}

class _AlbumFormState extends State<AlbumForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController ctrTitulo = TextEditingController();
  final TextEditingController ctrArtista = TextEditingController();
  final TextEditingController ctrAnio = TextEditingController();
  final TextEditingController ctrGender = TextEditingController();
  var selectedGenre = Genre.undefined;
  late final String tituloForm;
  int? id;

  @override
  void initState() {
    if (widget.album != null) {
      id = widget.album!.id;
      ctrTitulo.text = widget.album!.titulo;
      ctrArtista.text = widget.album!.artista;
      ctrAnio.text = widget.album!.anio.toString();
      selectedGenre = widget.album!.genre;
      tituloForm = "Editar Album";
    } else {
      tituloForm = "Nuevo Album";
    }
    super.initState();
  }

  @override
  void dispose() {
    ctrTitulo.dispose();
    ctrArtista.dispose();
    ctrAnio.dispose();
    ctrGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(tituloForm),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Título del album',
                  ),
                  controller: ctrTitulo,
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Proporcione un título para el album';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Intérprete del album',
                  ),
                  controller: ctrArtista,
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Proporcione un intérprete para el album';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Año de lanzamiento',
                  ),
                  keyboardType: TextInputType.number,
                  controller: ctrAnio,
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Proporcione el año de lanzamiento del album';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(valor)) {
                      return 'El año debe ser un número entre 1700 y 2025';
                    } else {
                      var anio = int.parse(valor);
                      if (anio <= 1700 || anio >= 2025) {
                        return 'El año debe estar entre 1700 y 2025';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                DropdownMenu<Genre>(
                  initialSelection: selectedGenre,
                  label: const Text("Género"),
                  dropdownMenuEntries: genres.keys
                      .map<DropdownMenuEntry<Genre>>((key) {
                        return DropdownMenuEntry(
                          value: key,
                          label: genres[key],
                        );
                      })
                      .toList(),
                  onSelected: (Genre? valor) {
                    selectedGenre = valor!;
                  },
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _validar,
                      child: const Text("Aceptar"),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancelar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validar() {
    final form = _formkey.currentState;
    if (form?.validate() == false) {
      return;
    }
    final Album album = Album(
      id: id,
      titulo: ctrTitulo.text,
      artista: ctrArtista.text,
      anio: int.parse(ctrAnio.text),
      genre: selectedGenre,
    );
    Navigator.pop(context, album);
  }
}

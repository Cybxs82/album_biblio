import 'package:flutter/material.dart';

// Jesus Leonardo Dominguez Pazos

class PerfilUsuario extends StatelessWidget {
  final String nombre = "Jesus Leonardo";
  final String puesto = "Desarrollador Informatico";
  final String descripcion =
      "Experiencia en apps para empresas y proyectos personales con diseño limpio";
  final String correo = "LeonardoPrueba@email.com";
  final String telefono = "+52 6624032025";
  final String fotoPerfil = "assets/fotoPerfil.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 132, 31, 1),
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          "Perfil de Usuario",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromRGBO(255, 132, 31, 1),
          child: Container(
            width: 350,
            height: 450,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage(fotoPerfil),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  puesto,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 32,
                  thickness: 2,
                  color: Colors.white54,
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  descripcion,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      correo,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      telefono,
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
}

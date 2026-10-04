import 'package:flutter/material.dart'; // libreria de widgets (componentes)
// importacion de class
import 'package:hibrida_ar/screen_modelos3d/san_salvador/divino_salvador.dart';
import 'package:hibrida_ar/screen_modelos3d/san_salvador/festividad.dart';
import 'package:hibrida_ar/screen_modelos3d/san_salvador/itma.dart';
import 'package:hibrida_ar/screen_modelos3d/san_salvador/mercado12.dart';

class SanSalvadorScreen extends StatelessWidget {
  const SanSalvadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
        title: const Text(
          "San Salvador Cuauhtenco", //titulo de la appbarr
          style: TextStyle(
            //fontSize: 20, // tamaño del texto
            color: Colors.white, // color del text-appBarr
            fontWeight: FontWeight.w600, // negrita
          ),
        ),
        // color de boton en appbarr
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // toda la pantalla ---------------------------------------------------
      body: Container(
        padding: EdgeInsets.all(10), // margen
        height: double.infinity, // alto (responsivo)
        // pantalla SCROLLEABLE (responsive)
        child: SingleChildScrollView(
          // centrar columna
          child: Center(
            // componentes en columna
            child: Column(
              // ubicacion componetes vertical
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10, // espacio general entre componentes
              children: [
                // componentes en fila
                Row(
                  children: [
                    Text(
                      "Elige el sitio de interes",
                      style: TextStyle(
                        color: Colors.black, // color del text
                        fontSize: 20, // tamaño del texto
                        fontStyle: FontStyle.normal, // tipografia
                        fontWeight: FontWeight.w600, // negrita
                      ),
                    ),
                  ],
                ),

                // boton 1 ---------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => itmaScreen(), // instancia
                      ),
                    );
                  },
                  // estilo del boton
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[100], // color
                    padding: EdgeInsets.all(5), // margen boton
                    elevation: 20, // sombreado (efecto visual)
                  ),
                  // componetes en fila dentro de boton
                  child: Row(
                    // posicion componentes en horizontal
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10, // espacio entre componetes(general)
                    children: [
                      // imagen cicular
                      CircleAvatar(
                        radius: 30, // tamaño
                        // insertar imagen
                        backgroundImage: AssetImage(
                          'assets/imagenes/milpaAR.jpg',
                        ),
                      ),
                      Text(
                        'Conoce el "Instituto \nTecnológico de Milpa Alta"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton2 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => divinoSalvadorScreen(), // instancia
                      ),
                    );
                  },
                  // estilo del boton
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[100], // color
                    padding: EdgeInsets.all(5), // margen boton
                    elevation: 20, // sombreado (efecto visual)
                  ),
                  // componetes en fila dentro de boton
                  child: Row(
                    // posicion componentes en horizontal
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10, // espacio entre componetes(general)
                    children: [
                      // imagen cicular
                      CircleAvatar(
                        radius: 30, // tamaño
                        // insertar imagen
                        backgroundImage: AssetImage(
                          'assets/imagenes/milpaAR.jpg',
                        ),
                      ),
                      Text(
                        'Conoce la "Iglesia del Divino\n Salvador de Cuauhtenco"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton3 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mercado2Screen(), // instancia
                      ),
                    );
                  },
                  // estilo del boton
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[100], // color
                    padding: EdgeInsets.all(5), // margen boton
                    elevation: 20, // sombreado (efecto visual)
                  ),
                  // componetes en fila dentro de boton
                  child: Row(
                    // posicion componentes en horizontal
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10, // espacio entre componetes(general)
                    children: [
                      // imagen cicular
                      CircleAvatar(
                        radius: 30, // tamaño
                        // insertar imagen
                        backgroundImage: AssetImage(
                          'assets/imagenes/milpaAR.jpg',
                        ),
                      ),
                      Text(
                        'Conoce el "Mercado 12\n de octubre "',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // espacio entre componentes (columna)
                // boton "Festividades" -------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                festividadSansalvadorScreen(), // instancia
                      ),
                    );
                  },
                  // estilo del boton
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // color
                    padding: EdgeInsets.all(5), // margen boton
                    elevation: 20, // sombreado (efecto visual)
                  ),
                  // imagen cicular
                  child: CircleAvatar(
                    radius: 30, // tamaño
                    // insertar imagen
                    backgroundImage: AssetImage('assets/imagenes/milpaAR.jpg'),
                  ),
                ),
                Text("Festividades"), // texto
              ],
            ),
          ),
        ),
      ),
    );
  }
}

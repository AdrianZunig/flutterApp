import 'package:flutter/material.dart'; // widgets (componetes)
import 'package:hibrida_ar/screen_modelos3d/san_pablo/capilla_Lupita.dart'; // class
import 'package:hibrida_ar/screen_modelos3d/san_pablo/casa_quinta.dart'; // class
import 'package:hibrida_ar/screen_modelos3d/san_pablo/cuartel_zapatista.dart';
import 'package:hibrida_ar/screen_modelos3d/san_pablo/festividad.dart';
import 'package:hibrida_ar/screen_modelos3d/san_pablo/mercado_sanPablo.dart';
import 'package:hibrida_ar/screen_modelos3d/san_pablo/parroquia_sanpablo.dart'; // calss

class SanPabloScreen extends StatelessWidget {
  const SanPabloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold fondo y estructura de la pantalla
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
        title: const Text(
          "San Pablo Oztotepec", //titulo de la appbarr
          style: TextStyle(
            fontSize: 20, // tamaño del texto
            color: Colors.white, // color del text-appBarr
            fontWeight: FontWeight.w600, // negrita
            fontStyle: FontStyle.normal, // tipografia
          ),
        ),
        // color de boton en appbar
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
                        builder:
                            (context) => capillaLupitaScreen(), // instancia
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
                        'Conoce la "Capilla La Lupita"',
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
                        builder: (context) => cuarZpatistaScreen(), // instancia
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
                        'Conoce el "Cuartel Zapatista"',
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
                        builder: (context) => casaQuintaScreen(), // instancia
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
                        'Conoce la "Casa de Cultura\n Quinta Axayopa"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 4 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => parroSanpabloScreen(), // instancia
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
                        'Conoce la "Parroquia San\n Pablo Apóstol"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 5 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => mercadoSanpabloScreen(), // instancia
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
                        'Conoce el "Mercado - San Pablo\n Oztotepec"',
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
                                festividadSanpabloScreen(), // instancia
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

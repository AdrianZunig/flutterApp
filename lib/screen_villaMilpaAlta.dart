import 'package:flutter/material.dart'; // widgets (componetes)
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/capilla_srMisericordias.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/convento_asuncion.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/explanada_alcaldia.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/festividad.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/mercado.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/milpa_bus.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/mirador_mora.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/museo_altepepialcalli.dart';
import 'package:hibrida_ar/screen_modelos3d/villa_milpaAlta/volcan_teuhtli.dart';

class VillaMilpaAltaScreen extends StatelessWidget {
  const VillaMilpaAltaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold fondo y estructura de la pantalla
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        title: const Text(
          "Villa Milpa Alta", //titulo de la appbarr
          style: TextStyle(
            fontSize: 20, // tamaño del texto
            color: Colors.white, // color del text-appBarr
            fontWeight: FontWeight.w600, // negrita
            fontStyle: FontStyle.normal, // tipografia
          ),
        ),
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
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
                        builder: (context) => mercMilpaScreen(), // instancia
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
                        'Conoce "Mercado Benito Juárez"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 2 ----------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => exconvenAsuncionScreen(), // instancia
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
                        'Conoce la "Parroquia y Ex-convento\n de la Asunción de Nuestra Señora"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 3 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                museoAltepepialcalliScreen(), // instancia
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
                        'Conoce el "Museo Regional\n Altepepialcalli"',
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
                        builder: (context) => miradorMoraScreen(), // instancia
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
                        'Conoce el "Mirador la Mora (San\n Mateo)"',
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
                        builder: (context) => explAlcaldiaScreen(), // instancia
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
                        'Conoce la "Explanada de la Alcaldía"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 6 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                capiSrmisericordiasScreen(), // instancia
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
                        'Conoce "Capilla de Nuestra Señora\n de Guadalupe"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 7 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => milpaBusScreen(), // instancia
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
                        'Conoce "Milpa Bus"',
                        textAlign: TextAlign.start, // posicion texto
                        // estilo texto
                        style: TextStyle(
                          color: Colors.black87, // color
                        ),
                      ),
                    ],
                  ),
                ),
                // boton 8 ----------------------------------------------------------
                ElevatedButton(
                  // accion al hacer precion
                  onPressed: () {
                    // Navegar a la pantalla de "Barra Navegacion"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => volcanTeuthliScreen(), // instancia
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
                        'Conoce el "Volcán Teuhtli"',
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
                                festividadVillamilpaScreen(), // instancia
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

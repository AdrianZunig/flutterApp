import 'package:flutter/material.dart'; // widgets (componetes)
// importacion de class
import 'package:hibrida_ar/screen_sanAgustin.dart';
import 'package:hibrida_ar/screen_sanAntonioTecomitl.dart';
import 'package:hibrida_ar/screen_sanBartolome.dart';
import 'package:hibrida_ar/screen_sanFrancisco.dart';
import 'package:hibrida_ar/screen_sanJeronimo.dart';
import 'package:hibrida_ar/screen_sanJuan.dart';
import 'package:hibrida_ar/screen_sanLorenzo.dart';
import 'package:hibrida_ar/screen_sanPablo.dart';
import 'package:hibrida_ar/screen_sanPedro.dart';
import 'package:hibrida_ar/screen_sanSalvador.dart';
import 'package:hibrida_ar/screen_santaAnaTlacotenco.dart';
import 'package:hibrida_ar/screen_villaMilpaAlta.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold fondo blanco y estructura de la pantalla
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
        title: const Text(
          "Milpa AR", //titulo de la appbarr
          style: TextStyle(
            //fontSize: 23, // tamaño del texto
            color: Colors.white, // color del text-appBarr
            fontWeight: FontWeight.w600, // negrita
          ),
        ),
      ),
      // body es toda la pantalla ----------------------------------------------------
      body: Container(
        // color: Colors.teal[100],
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
              children: [
                SizedBox(height: 10), // espacio entre componente (vertical)
                // componentes en fila ------------------------------------------------------
                Row(
                  children: [
                    // texto en pantalla
                    Text(
                      "Colonias de Milpa Alta", // text en pantalla
                      style: TextStyle(
                        color: Colors.black, // color del text
                        fontSize: 20, // tamaño del texto
                        fontStyle: FontStyle.normal, // tipografia
                        fontWeight: FontWeight.w600, // negrita
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15), // espacio entre componente (vertical)
                // componentes en columna (uno bajo otro)
                Column(
                  children: [
                    // componentes fila (1) ----------------------------------------------------
                    Row(
                      // posicion componentes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // responsive
                      //spacing: 50, // espacio general entre componentes (fila)
                      children: <Widget>[
                        // creacion de boton (1)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "screen_sanSalvado"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanSalvadorScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanSalvador.png',
                            ),
                          ),
                        ),
                        // creacion de boton (2)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SanPabloScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanPablo.png',
                            ),
                          ),
                        ),
                        // creacion de boton (3)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanBartolomeScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanBartolome.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // componentes fila (1) textos
                    Row(
                      //posicion Componentes en fila
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // responsive
                      //spacing: 40, // espacio general entre componentes (fila)
                      children: [
                        Text(
                          "San Salvador\n Cuauhtenco", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Pablo\n Oztotepec", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Bartolomé\n Xicomulco", // text en pantalla
                          textAlign: TextAlign.center, // textoc centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25), // espacio entre componente (fila)
                    // componentes en fila (2) ---------------------------------------------------
                    Row(
                      // poicion componentes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // reponsive
                      //spacing: 50, // espacio general entre componentes (fila)
                      children: <Widget>[
                        // creacion de boton (4)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SanPedroScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/San Pedro.png',
                            ),
                          ),
                        ),
                        // creacion de boton (5)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanLorenzoScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanLorenzo.png',
                            ),
                          ),
                        ),
                        // creacion de boton (6)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        VillaMilpaAltaScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/MilpaAlta.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // componentes fila (2) text
                    Row(
                      // posicion componentes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // reponsive
                      //spacing: 50, // espacio genral entre componentes (fila)
                      children: [
                        Text(
                          "San Pedro\n Atocpan", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Lorenzo\n Tlacoyucan", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "Villa Milpa\n Alta", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25), // espacio entre componente (fila)
                    // componentes fila (3) ---------------------------------------------------------
                    Row(
                      // posicion compnetes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // reponsive
                      //spacing: 50, // espacio general entre componentes (fila)
                      children: <Widget>[
                        // creacion de boton (7)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanAgustinScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanAgustin.png',
                            ),
                          ),
                        ),
                        // creacion de boton (8)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanJeronimoScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanJeronimo.png',
                            ),
                          ),
                        ),
                        // creacion de boton (9)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanFranciscoScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanFrancisco.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // componentes fila (3) text
                    Row(
                      // posicion componetes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // responsive
                      //spacing: 45, // espacio genral entre componentes (fila)
                      children: [
                        Text(
                          "San Agustín\n Ohtenco", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Jerónimo\n Miacatlán", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Francisco\n Tecoxpa", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 13, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25), // espacio entre componente (fila)
                    // componentes fila (4) -----------------------------------------------------
                    Row(
                      // posicion componentes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // responsive
                      //spacing: 50, // espacio general entre componentes (fila)
                      children: <Widget>[
                        // creacion de boton (10)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SantaAnaTlacotencoScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SantaAna.png',
                            ),
                          ),
                        ),
                        // creacion de boton (11)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SanJuanScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/SanJuan.png',
                            ),
                          ),
                        ),
                        // creacion de boton (12)
                        ElevatedButton(
                          // accion al hacer precion
                          onPressed: () {
                            // Navegar a la pantalla de "Barra Navegacion"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SanAntonioTecomitlScreen(), // instancia
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
                            backgroundImage: AssetImage(
                              'assets/imagenes/Tecomitl.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // componentes fila (4) text
                    Row(
                      // posicion componetes en horizontal
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // responsive
                      //spacing: 45, // espacio genral entre componentes (fila)
                      children: [
                        Text(
                          "Santa Ana\n Tlacotenco", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 15, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Juan\n Tepenáhuac", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 15, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                        Text(
                          "San Antonio\n Tecómitl", // text en pantalla
                          textAlign: TextAlign.center, // texto centrado
                          style: TextStyle(
                            color: Colors.black87, // color del text
                            //fontSize: 15, // tamaño del texto
                            fontStyle: FontStyle.normal, // tipografia
                          ),
                        ),
                      ],
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

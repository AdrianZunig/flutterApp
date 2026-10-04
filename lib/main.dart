import 'package:flutter/material.dart'; // widgets (componetes)
// impportacion clase
import 'package:hibrida_ar/home_screen.dart'; // class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // quitar marca de agua
      home:
          HomeScreen(), // llamar a la clase homeScreen para mostrarla en pantalla
    );
  }
}
 
// ========= GUIA ==============
 /* 
    Combinaciones de teclas:
     ctrl + espacio = autocompletar codigo/sugerencias
     ctrl + . = posibles soluciones a errores

    Atajos de codigo:
    StatelessWidget = stl y (ctrl + espacio)  // widgets componentes
    StatefulWidget = stf y (ctrl + espacio) // estado app / logica

    Instalacion de librerias:
      NOTA: importar, cursor sobre la libreria y usar combinacion de teclas,
      (ctrl + . ), para ver la opcion de instalar
      
     import 'package:audioplayers/audioplayers.dart'; // libreria para audios
     import 'package:model_viewer_plus/model_viewer_plus.dart'; // libreri mdl3D y AR

    Archivo "pubspec.yaml" -------------------------------------------------
      *NOTA: accede al "pubspec.yaml", de este proyecto para mas detalles de 
      configuracion.

      Sirve para:
      # Agregar/acceder a archivos para la app:
      assets:
      - assets/imagenes/
      - assets/3d/
      - assets/audios/sanSalvador/

      flutter_native_splash: # agregar pantalla de carga
      flutter_launcher_icons: # cambiar icono de app
 */
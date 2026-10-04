import 'package:flutter/material.dart'; // widgets (componentes)
import 'package:audioplayers/audioplayers.dart'; // libreria para audios
import 'package:model_viewer_plus/model_viewer_plus.dart'; // libreri mdl3D y AR

class parroSantAnaTlaScreen extends StatefulWidget {
  const parroSantAnaTlaScreen({super.key});

  @override
  State<parroSantAnaTlaScreen> createState() => _parroSantAnaTlaScreenState();
}

// StatefulWidget para manejar el estado del audio.
// WidgetsBindingObserver: Detener en segundo planos
class _parroSantAnaTlaScreenState extends State<parroSantAnaTlaScreen>
    with WidgetsBindingObserver {
  // Controladores de audio
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // Agregar observador del ciclo de vida de la app
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remover observador del ciclo de vida
    WidgetsBinding.instance.removeObserver(this);
    // Detener y liberar el audio cuando se sales de la pantalla
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  // Detectar cuando la app se cierra completamente
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // La app se está cerrando completamente
      _audioPlayer.stop();
    } else if (state == AppLifecycleState.paused) {
      // La app está en segundo plano (se fue a otra app o pantalla)
      _audioPlayer.stop();
    }
  }

  Future<void> _toggleAudio() async {
    // CASO 1: El mismo audio está sonando → LO PAUSAMOS
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    }
    // CASO 2: El mismo audio está pausado → LO REANUDAMOS
    else {
      // Si no está reproduciendo, reiniciar desde el inicio
      await _audioPlayer.resume();
      await _audioPlayer.play(
        AssetSource(
          'audios/sanSalvador/Parroquia de Nuestra Señora de Santa Ana.mp3',
        ),
      );
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
        title: const Text(
          "Parroquia Nuestra Señora de Santa Ana", //titulo de la appbarr
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
      // Body (toda pantalla) ---------------------------------------------------------
      body: Container(
        height: double.infinity, // alto (responsivo)
        padding: EdgeInsets.all(10), // margen
        // pantalla SCROLLEABLE (reponsive)
        child: SingleChildScrollView(
          // componetes en columna
          child: Column(
            // ubicacion componetes vertical
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Experiencia de "Realidad Aumentada", al presionar el icono con el cubo.',
              ),
              // CONTENEDOR 1 Objeto 3D - Widget const para evitar reinicio
              const _Model3DWidget(), // llamar
              //SizedBox(height: 20), // espacio vertical
              // CONTENEDOR 2 - Solo el botón se redibuja
              Container(
                padding: EdgeInsets.all(10), // margen
                width: double.infinity, //ancho
                //height: 50, // alto
                child: Row(
                  // alinear compontes a la isquierda
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10, // espacio general entre componentes
                  children: [
                    const Text(
                      "Escuchar la información.",
                      textAlign: TextAlign.end,
                    ),
                    // creacion de boton (1)
                    ElevatedButton(
                      // accion al hacer precion
                      onPressed: _toggleAudio,
                      // estilo del boton
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // color
                        padding: EdgeInsets.all(5), // margen boton
                        elevation: 20, // sombreado (efecto visual)
                        shape: CircleBorder(), // Botón circular
                      ),
                      // insertar icono
                      child: Icon(
                        _isPlaying
                            ? Icons.pause
                            : Icons.play_arrow, // icono dinámico
                        color: Colors.white, // color
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // contenedor 3 de texto scrolleable - Widget const para evitar reinicio
              const _TextInfoWidget(), // llamar
            ],
          ),
        ),
      ),
    );
  }
}

// Widget separado const para el modelo 3D - NO se redibuja al cambiar estado del audio
class _Model3DWidget extends StatelessWidget {
  const _Model3DWidget(); // const para evitar reinicio

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7), // margen
      height: 330, // alto
      width: double.infinity, // ancho (resposivo)
      // estilo del contenedor
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // bordes redondos
        color: Colors.blueGrey[100], // color
      ),
      // insertar modelo 3d
      child: ModelViewer(src: "assets/3d/parroquia_santaAna.glb", ar: true),
    );
  }
}

// Widget separado const para el texto - NO se redibuja al cambiar estado del audio
class _TextInfoWidget extends StatelessWidget {
  const _TextInfoWidget(); // const para evitar reinicio

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // alto
      width: double.infinity, // ancho (responsivo)
      // estilo del contenedor
      decoration: BoxDecoration(
        color: Colors.teal[50], // color
        // bordes del contenedor
        border: Border.all(
          color: Colors.teal, // color borde
          width: 2, // ancho del borde
        ),
        borderRadius: BorderRadius.circular(20), // borde redondo
      ),
      padding: EdgeInsets.all(15), // margen
      // SCROLL interno del contenedor --------------
      child: SingleChildScrollView(
        // componentes en columna scrolleable
        child: Column(
          //alineacio componetes en vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // texto en pantalla
            Text(
              "Santa Ana Tlacotenco / Parroquia Nuestra Señora de Santa Ana",
              // estilo texto
              style: TextStyle(
                fontSize: 18, // tamaño
                fontWeight: FontWeight.bold, // tipo letra
                color: Colors.teal[900], // color
              ),
            ),
            SizedBox(height: 10), // espacio en vertical
            Text(
              'Los cimientos originales datan del siglo XVI (aprox. 1570), establecidos por los '
              'frailes franciscanos. La estructura actual presenta modificaciones y ampliaciones '
              'realizadas principalmente durante el siglo XVII y XVIII. Tlacotenco proviene del '
              'náhuatl y significa "A la orilla de las jarillas" o "En la orilla de los matorrales".\n\n'
              'Posee una torre esbelta de dos cuerpos con remate piramidal, que sirve como '
              'punto de referencia visual para los habitantes que trabajan en los campos de nopal '
              'circundantes. Interior: Resguarda la imagen de Santa Ana, la madre de la Virgen '
              'María, quien es la protectora de las familias y de la lengua materna en este pueblo.\n'
              'Fiesta Patronal: Se celebra el 26 de julio. Es una de las festividades más coloridas '
              'de la alcaldía, destacando las portadas florales monumentales, la música de '
              'banda.',
              textAlign: TextAlign.left, // texto alineado a izquierda
              // estilo del texto
              style: TextStyle(
                fontSize: 14, // tamaño
                color: Colors.black87, // color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

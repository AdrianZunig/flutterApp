import 'package:audioplayers/audioplayers.dart'; // libreria para audios
import 'package:flutter/material.dart'; // widgets (componetes)
import 'package:model_viewer_plus/model_viewer_plus.dart'; // libreri mdl3D y AR

class divinoSalvadorScreen extends StatefulWidget {
  const divinoSalvadorScreen({super.key});
  @override
  State<divinoSalvadorScreen> createState() => _SalvadorScreenState();
}

// StatefulWidget para manejar el estado del audio.
// WidgetsBindingObserver: Detener en segundo planos
class _SalvadorScreenState extends State<divinoSalvadorScreen>
    with WidgetsBindingObserver {
  // Atributos
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false; // estado audio (reproducien/apagado)
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
      await _audioPlayer.pause(); // pausar
      setState(() {
        _isPlaying = false; // audio apagado
      });
    }
    // CASO 2: El mismo audio está pausado → LO REANUDAMOS
    else {
      // Si no está reproduciendo, reiniciar desde el inicio
      await _audioPlayer.resume(); // reanudar audio
      await _audioPlayer.play(
        AssetSource(
          'audios/sanSalvador/IGLECIA DEL DIVINO SALVADOR DE CUAUHTENCO.mp3',
        ),
      );
      setState(() {
        _isPlaying = true; // audio reproduciendo
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
          "Iglesia del Divino Salvador de Cuauhtenco", //titulo de la appbarr
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
                        shape: CircleBorder(),
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
      // insertar modelo 3d y AR (realidad aumentada)
      child: ModelViewer(src: 'assets/3d/iglesiaDivinoSalvador.glb', ar: true),
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
              "San Salvador Cuauhtenco / Iglesia del Divino Salvador de Cuauhtenco",
              // estilo texto
              style: TextStyle(
                fontSize: 18, // tamaño
                fontWeight: FontWeight.bold, // tipo letra
                color: Colors.teal[900], // color
              ),
            ),
            SizedBox(height: 10), // espacio en vertical
            Text(
              'La construcción original se remonta al siglo XVI (probablemente iniciada en el '
              'primer tercio), con etapas de consolidación y ampliación que se extendieron '
              'durante el siglo XVII y finalizaron formalmente hacia el año 1700.\n\n'
              'Evangelización: Fue fundada por la orden de los Franciscanos, quienes '
              'establecieron el culto al Divino Salvador sobre un antiguo asentamiento indígena '
              'dedicado a la recolección de madera (de ahí el nombre Cuauhtenco: "a la orilla del '
              'bosque"). En el interior resguarda imágenes religiosas de gran valor devocional, '
              'destacando la figura del Divino Salvador, cuya iconografía está vinculada a la '
              'Transfiguración.\n\n'
              'El 6 de agosto se celebra la fiesta patronal en honor al Divino Salvador. Es una '
              'oportunidad única para observar danzas tradicionales, alfombras de aserrín y la '
              'gastronomía local basada en el mole y el nopal.\n'
              'Estilo: Es un ejemplo sobresaliente del barroco sobrio o rural. Presenta una '
              'fachada sencilla de piedra volcánica (tezontle y basalto) unida con argamasas '
              'tradicionales de la región.\n\n'
              'Estructura: Posee una nave única con una torre campanario que destaca en el '
              'paisaje del pueblo. El atrio, aunque ha sido modificado con el tiempo, conserva su '
              'función como el espacio de reunión social y religiosa más importante de la '
              'comunidad.',
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

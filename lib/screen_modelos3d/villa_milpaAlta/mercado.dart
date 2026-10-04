import 'package:audioplayers/audioplayers.dart'; // libreria para audio
import 'package:flutter/material.dart'; // widgets componentes
import 'package:model_viewer_plus/model_viewer_plus.dart'; // libreria mdlo 3d y ar

class mercMilpaScreen extends StatefulWidget {
  const mercMilpaScreen({super.key});

  @override
  State<mercMilpaScreen> createState() => _mercMilpaScreenState();
}

// StatefulWidget para manejar el estado del audio.
// WidgetsBindingObserver: Detener en segundo planos
class _mercMilpaScreenState extends State<mercMilpaScreen>
    with WidgetsBindingObserver {
  // Controladores de audio
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false; // estado audio (repoduciendo/apagado)

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
      await _audioPlayer.resume(); // reanudar audio
      // reproducir audio
      await _audioPlayer.play(
        AssetSource('audios/sanSalvador/mercado_milpaAlta.mp3'), // pasar audio
      );
      setState(() {
        _isPlaying = true; // audio reproduciendo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // scaffold fondo blanco y estructura de la pantalla
    return Scaffold(
      // creacion de barra superior
      appBar: AppBar(
        backgroundColor: Colors.teal, // color del appbar
        centerTitle: false, // centrar titulo
        title: const Text(
          "Mercado Benito Juárez", //titulo de la appbarr
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
                        size: 30, // tamaño icono
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
      child: ModelViewer(src: "assets/3d/mercadoMilpaAlta.glb", ar: true),
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
      // SCROLL interno del contenedor -----------------------------------------------
      child: SingleChildScrollView(
        // componentes en columna scrolleable
        child: Column(
          //alineacio componetes en vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // texto en pantalla
            Text(
              "Villa Milpa Alta / Mercado Benito Juárez",
              // estilo texto
              style: TextStyle(
                fontSize: 18, // tamaño
                fontWeight: FontWeight.bold, // tipo letra
                color: Colors.teal[900], // color
              ),
            ),
            SizedBox(height: 10), // espacio en vertical
            Text(
              'Este mercado es el principal motor económico y comercial de la cabecera de la alcaldía. A diferencia de otros mercados de la Ciudad de México, este espacio conserva una fuerte esencia rural, donde agricultores y productores locales de los 12 pueblos de Milpa Alta confluyen diariamente para vender de manera directa.\n\n'
              'Riqueza Gastronómica y Productos:\n\n'
              'El "Oro Verde" (El Nopal): Al ser Milpa Alta uno de los mayores productores de nopal a nivel nacional, este mercado ofrece nopal fresco en todas sus variantes: tierno, picado, en salmuera, o preparado en platillos tradicionales como los nopales navegantes.\n\n'
              'Variedad de Moles: Aunque San Pedro Atocpan es la capital mundial del mole, en este mercado encuentras una oferta monumental de pastas de mole artesanal (almendrado, especial, verde, pipián) listas para llevar.\n\n'
              'Comida Corrida y Antojitos: Es el sitio ideal para probar la gastronomía de la montaña. Destacan los tamales de ollita (masa suave cocida dentro de una pequeña cavidad), el atole de grano, los tlacoyos de haba o frijol cocidos al comal, y la barbacoa de borrego.\n\n'
              'Productos de Recolección: Dependiendo de la temporada (especialmente en época de lluvias), los comuneros llevan a vender hongos silvestres de los bosques de la zona alta, chilacayotes, flores de calabaza y elotes frescos.',
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

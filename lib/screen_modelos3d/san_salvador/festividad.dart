import 'package:audioplayers/audioplayers.dart'; // libreria para audios
import 'package:flutter/material.dart'; // widgets (componentes)
import 'package:carousel_slider/carousel_slider.dart'; // libreria para carrusel

class festividadSansalvadorScreen extends StatefulWidget {
  const festividadSansalvadorScreen({super.key});

  @override
  State<festividadSansalvadorScreen> createState() =>
      _festividadSansalvadorScreenState();
}

// StatefulWidget para manejar el estado del audio.
// WidgetsBindingObserver: Detener en segundo plano audio
class _festividadSansalvadorScreenState
    extends State<festividadSansalvadorScreen>
    with WidgetsBindingObserver {
  // CREAMOS UNA LISTA DE MAPAS (objetos) PARA MANEJAR: imagen, audio y texto
  final List<Map<String, String>> festividadList = [
    // item 1
    {
      'imagen': 'assets/imagenes/1.2_festividad_feria.png',
      'titulo': 'Fiesta Patronal (Divino Salvador del Mundo).',
      'audio': 'audios/sanSalvador/1.1_fest_sansalvador.mp3',
      'descripcion':
          '\nSe celebra el 6 de agosto en honor a la Transfiguración del Señor. Es la fiesta más importante del pueblo, con misas solemnes, peregrinaciones, bailes tradicionales y eventos culturales que suelen extenderse por varios días (en 2025 se programaron eventos hasta el 17 de agosto).',
    },
    // item 2
    {
      'imagen': 'assets/imagenes/1.12_festividad.png',
      'titulo': 'Feria de la Barbacoa.',
      'audio': 'audios/sanSalvador/1.2_fest_sansalvador.mp3',
      'descripcion':
          '\nEste evento emblemático se realiza anualmente entre finales de noviembre y principios de diciembre (en 2025 fue del 29 de noviembre al 7 de diciembre). Actualmente, se lleva a cabo una edición especial en el parque Tepecuente que inició este 22 de abril y termina el 16 de mayo. Podrás disfrutar de la tradicional barbacoa de hoyo, consomé y productos artesanales de la región.',
    },
    // item 3
    {
      'imagen': 'assets/imagenes/1.6_festividad.png',
      'titulo': 'Carnaval de San Salvador Cuauhtenco.',
      'audio': 'audios/sanSalvador/1.3_fest_sansalvador.mp3',
      'descripcion':
          '\nUna celebración llena de color con el brinco de los Chinelos. Para 2026, se programó un evento público con bandas de música para el 11 de abril. También se registran actividades de carnaval en fechas cercanas a febrero (1, 2 y 8 de febrero de 2026 según reportes locales).',
    },
  ];

  // Controladores de audio
  late AudioPlayer _audioPlayer;

  // ✅ IMPORTANTE: Guardamos qué item está reproduciendo audio actualmente
  int? _currentPlayingIndex; // null = ningún audio reproduciendo
  bool _isPlaying = false; // estado audio (reproduciendo/apagado)

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // Agregar observador del ciclo de vida de la app
    WidgetsBinding.instance.addObserver(this);

    // ✅ Escuchar cuando el audio termina naturalmente
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _currentPlayingIndex = null; // Resetear cuando termina
      });
    });
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.paused) {
      // La app se está cerrando completamente
      _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
        _currentPlayingIndex = null;
      });
    }
  }

  // FUNCIÓN MEJORADA: Recibe el índice y la ruta del audio
  Future<void> _toggleAudio(int itemIndex, String audioPath) async {
    // CASO 1: El mismo audio está sonando → LO PAUSAMOS
    if (_currentPlayingIndex == itemIndex && _isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
        // NOTA: NO reseteamos _currentPlayingIndex para saber cuál estaba pausado
      });
    }
    // CASO 2: El mismo audio está pausado → LO REANUDAMOS
    else if (_currentPlayingIndex == itemIndex && !_isPlaying) {
      await _audioPlayer.resume();
      setState(() {
        _isPlaying = true;
      });
    }
    // CASO 3: Es un audio DIFERENTE → PARAMOS el actual y REPRODUCIMOS el nuevo
    else {
      // Detener cualquier audio que esté sonando
      if (_audioPlayer.state == PlayerState.playing) {
        await _audioPlayer.stop();
      }

      // Reproducir el nuevo audio desde el inicio
      await _audioPlayer.play(AssetSource(audioPath));

      setState(() {
        _currentPlayingIndex = itemIndex; // Guardamos qué item está sonando
        _isPlaying = true;
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
          "Festividades", //titulo de la appbarr
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
          // centrar columna
          child: Center(
            // componentes en columna
            child: Column(
              // ubicacion componetes vertical
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // componentes en fila ------------------------------------------------------
                Row(
                  children: [
                    Text(
                      "San Salvador Cuauhtenco", // texto en pantalla
                      style: TextStyle(
                        color: Colors.black, // color del text
                        fontSize: 20, // tamaño del texto
                        fontStyle: FontStyle.normal, // tipografia
                        fontWeight: FontWeight.w600, // negrita
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40), // espacio vertical entre componentes
                // creacion de carusel -----------------------------------------------------
                CarouselSlider(
                  // estilo de carrusel
                  options: CarouselOptions(
                    height: 550, // alto de carrusel
                    //autoPlay: true, // avanze automatico
                    enableInfiniteScroll: false, // carrusle inicio-fin
                    enlargeCenterPage: true, // resaltar item actual
                    // ✅ IMPORTANTE: Detectar cuándo cambia de item
                    onPageChanged: (index, reason) {
                      // Cuando el usuario navega a otro item, DETENEMOS el audio
                      if (_currentPlayingIndex != null &&
                          _currentPlayingIndex != index) {
                        _audioPlayer.stop();
                        setState(() {
                          _isPlaying = false;
                          _currentPlayingIndex = null;
                        });
                      }
                    },
                  ),
                  // item es CADA objeto de la lista
                  items:
                      festividadList.asMap().entries.map((entry) {
                        final int index =
                            entry.key; // Índice del item (0, 1, 2...)
                        final Map<String, String> item =
                            entry.value; // Datos del item

                        // CONTENEDOR general carrusel ----------------------------------------------
                        return Container(
                          width: double.infinity, // ancho (resposivo)
                          // estilo contenedor
                          decoration: BoxDecoration(
                            color: Colors.teal[50], // color
                            // bordes redondos
                            borderRadius: BorderRadius.circular(20),
                            // bordes del contenedor
                            border: Border.all(
                              color: Colors.teal, // color borde
                              width: 2, // ancho del borde
                            ),
                          ),
                          // scrroll en contenedor de carrusel (reponsive)
                          child: SingleChildScrollView(
                            // centrar column
                            child: Center(
                              // componentes en columna
                              child: Column(
                                children: [
                                  // llamar CONTENEDOR 1 imagen ------------------------------------------------
                                  imagContenedor(
                                    item:
                                        item, // PASAMOS 'item'(lista) al widget imagen
                                  ),

                                  // boton de audio ---------------------------------------------------------
                                  // ✅ PASAMOS el índice y la ruta del audio
                                  botonContenedor(
                                    isPlaying:
                                        _currentPlayingIndex == index &&
                                        _isPlaying,
                                    onPressed:
                                        () =>
                                            _toggleAudio(index, item['audio']!),
                                  ),

                                  // llamar CONTENEDOR 2 infromacion --------------------------------------------
                                  infoContenedor(
                                    item:
                                        item, // PASAMOS 'item'(lista) al widget informacion
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(), // pasar lista (obligatorio)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// widget de imagen
class imagContenedor extends StatelessWidget {
  // Recibimos 'item' como parámetro
  final Map<String, String> item;
  // Constructor que recibe el parámetro
  const imagContenedor({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(5), // margen
      width: double.infinity, // ancho responsivo
      height: 200, // alto
      // estilo contenedor
      decoration: BoxDecoration(
        //color: Colors.transparent, // color
        // bordes redondos
        borderRadius: BorderRadius.circular(10),
      ),
      // insertar lista con imagenes
      child: Center(
        child: Image.asset(
          item['imagen']!, // Usamos la imagen de CADA item
        ),
      ),
    );
  }
}

// widget de boton audio
class botonContenedor extends StatelessWidget {
  final bool isPlaying; // ¿Este botón específico está reproduciendo audio?
  final VoidCallback onPressed; // Función a ejecutar al presionar

  // Constructor que recibe el parámetro
  const botonContenedor({
    super.key,
    required this.isPlaying,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // ROW elementos en fila
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // centrar elementos
      children: [
        Text('Escuchar'),
        ElevatedButton(
          onPressed: onPressed, // FUNCION al presionar el boton
          // estilo del boton
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // color
            padding: EdgeInsets.all(5), // margen boton
            elevation: 20, // sombreado (efecto visual)
            shape: CircleBorder(), // Botón circular
          ),
          // insertar icono
          child: Icon(
            // ✅ ÍCONO DINÁMICO: Play o Pause según estado
            isPlaying
                ? Icons
                    .pause // icono pausa
                : Icons.play_arrow, // icono play
            color: Colors.white,
            size: 30, // tamaño icono
          ),
        ),
        Text('información.'),
      ],
    );
  }
}

// widget de informacion
class infoContenedor extends StatelessWidget {
  // Recibimos 'item' como parámetro
  final Map<String, String> item;
  // Constructor que recibe el parámetro
  const infoContenedor({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // margen
      width: double.infinity, // ancho responsivo
      height: 250, // alto
      // texto con Scroll responsive --------------------------------
      child: SingleChildScrollView(
        // componentes en columna
        child: Column(
          //alineacio componetes en vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // texto en pantalla
            Text(
              item['titulo']!, // Título de CADA item
              // estilo texto
              style: TextStyle(
                fontSize: 18, // tamaño
                fontWeight: FontWeight.bold, // tipo letra
                color: Colors.teal[900], // color
              ),
            ),
            Text(
              item['descripcion']!, // Descripción de CADA item
              // texto alineado a izquierda
              textAlign: TextAlign.left,
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

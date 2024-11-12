import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart' as util;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_messages_model.dart';
export 'main_messages_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MainMessagesWidget extends StatefulWidget {
  const MainMessagesWidget({super.key});

  @override
  State<MainMessagesWidget> createState() => _MainMessagesWidgetState();
}

class _MainMessagesWidgetState extends State<MainMessagesWidget>
    with TickerProviderStateMixin {
  late MainMessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = util.createModel(context, () => MainMessagesModel());

    _calcularDistancia(); // Calcula a distância assim que a tela é carregada

    // util.logFirebaseEvent('screen_view',
    //     parameters: {'screen_name': 'Main_messages'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  GoogleMapController? _controladorMapa;

  // Pontos específicos das duas localidades
  final LatLng _pontoA = const LatLng(-9.972413115315575, -67.80791574242686); // Rua 14 de Julho, 5141
  final LatLng _pontoB = const LatLng(-9.951368295032635, -67.82165171759154); // Av. Afonso Pena, 4909

  // Variável para armazenar a distância calculada
  String _distancia = "0 km";

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _calcularDistancia() {
    final distanciaEmMetros = Geolocator.distanceBetween(
      _pontoA.latitude,
      _pontoA.longitude,
      _pontoB.latitude,
      _pontoB.longitude,
    );

    setState(() {
      _distancia = (distanciaEmMetros / 1000).toStringAsFixed(2) + " km";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: !util.isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  util.FFLocalizations.of(context).getText(
                    'ym579y79' /* Dashboard */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Column(children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) => _controladorMapa = controller,
              initialCameraPosition: CameraPosition(
                target: _pontoA, // Centralizando o mapa no ponto A
                zoom: 14,
              ),
              markers: {
                Marker(markerId: const MarkerId('pontoA'), position: _pontoA),
                Marker(markerId: const MarkerId('pontoB'), position: _pontoB),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Distância: $_distancia', style: const TextStyle(fontSize: 20)),
          ),
        ],
        ),
      ),
    );
  }
}
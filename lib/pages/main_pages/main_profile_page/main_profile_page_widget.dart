import '/components/modals/command_palette/command_palette_widget.dart';
import '/components/modals_extra/modal_profile_edit/modal_profile_edit_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_profile_page_model.dart';
export 'main_profile_page_model.dart';

class MainProfilePageWidget extends StatefulWidget {
  const MainProfilePageWidget({super.key});

  @override
  State<MainProfilePageWidget> createState() => _MainProfilePageWidgetState();
}

class _MainProfilePageWidgetState extends State<MainProfilePageWidget>
    with TickerProviderStateMixin {
  late MainProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainProfilePageModel());

    // logFirebaseEvent('screen_view',
    //     parameters: {'screen_name': 'Main_profilePage'});
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  wrapWithModel(
                    model: _model.webNavModel,
                    updateCallback: () => setState(() {}),
                    child: const WebNavWidget(
                      selectedNav: 5,
                    ),
                  ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qrxn5crt' /* My Profile */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation']!),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.search_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          // logFirebaseEvent(
                                          //     'MAIN_PROFILE_search_rounded_ICN_ON_TAP');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: const Color(0x1A000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const SizedBox(
                                                  height: double.infinity,
                                                  child: CommandPaletteWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: FlutterFlowTheme.of(context).secondaryBackground,
    boxShadow: [
      BoxShadow(
        blurRadius: 1.0,
        color: FlutterFlowTheme.of(context).primaryBackground,
        offset: const Offset(0.0, 0.0),
      )
    ],
  ),
  child: Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/foto-perfil.jpg', // Substitua pelo caminho da sua imagem
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'yj2g6q7m' /* Andrew D. */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.fromSTEB(
                                //       24.0, 12.0, 0.0, 0.0),
                                //   child: Text(
                                //     FFLocalizations.of(context).getText(
                                //       'fyxsf6vn' /* Account Settings */,
                                //     ),
                                //     style: FlutterFlowTheme.of(context)
                                //         .labelMedium
                                //         .override(
                                //           fontFamily: 'Plus Jakarta Sans',
                                //           letterSpacing: 0.0,
                                //         ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.fromSTEB(
                                //       16.0, 0.0, 16.0, 0.0),
                                //   child: InkWell(
                                //     splashColor: Colors.transparent,
                                //     focusColor: Colors.transparent,
                                //     hoverColor: Colors.transparent,
                                //     highlightColor: Colors.transparent,
                                //     onTap: () async {
                                //       logFirebaseEvent(
                                //           'MAIN_PROFILE_Container_geiuas93_ON_TAP');

                                //       context.pushNamed('forgotPassword');
                                //     },
                                //     child: AnimatedContainer(
                                //       duration: const Duration(milliseconds: 100),
                                //       curve: Curves.easeInOut,
                                //       width: double.infinity,
                                //       height: 60.0,
                                //       constraints: const BoxConstraints(
                                //         minHeight: 70.0,
                                //       ),
                                //       decoration: BoxDecoration(
                                //         color: FlutterFlowTheme.of(context)
                                //             .secondaryBackground,
                                //         boxShadow: const [
                                //           BoxShadow(
                                //             blurRadius: 3.0,
                                //             color: Color(0x33000000),
                                //             offset: Offset(
                                //               0.0,
                                //               1.0,
                                //             ),
                                //           )
                                //         ],
                                //         borderRadius:
                                //             BorderRadius.circular(12.0),
                                //         border: Border.all(
                                //           color: FlutterFlowTheme.of(context)
                                //               .alternate,
                                //           width: 1.0,
                                //         ),
                                //       ),
                                //       child: Padding(
                                //         padding: const EdgeInsetsDirectional.fromSTEB(
                                //             8.0, 8.0, 16.0, 8.0),
                                //         child: Row(
                                //           mainAxisSize: MainAxisSize.max,
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Padding(
                                //               padding: const EdgeInsetsDirectional
                                //                   .fromSTEB(
                                //                       12.0, 0.0, 0.0, 0.0),
                                //               child: Text(
                                //                 FFLocalizations.of(context)
                                //                     .getText(
                                //                   'h43llaan' /* Change Password */,
                                //                 ),
                                //                 style:
                                //                     FlutterFlowTheme.of(context)
                                //                         .labelLarge
                                //                         .override(
                                //                           fontFamily:
                                //                               'Plus Jakarta Sans',
                                //                           letterSpacing: 0.0,
                                //                         ),
                                //               ),
                                //             ),
                                //             Align(
                                //               alignment: const AlignmentDirectional(
                                //                   0.9, 0.0),
                                //               child: Icon(
                                //                 Icons.arrow_forward_ios,
                                //                 color:
                                //                     FlutterFlowTheme.of(context)
                                //                         .secondaryText,
                                //                 size: 18.0,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Builder(
                                //   builder: (context) => Padding(
                                //     padding: const EdgeInsetsDirectional.fromSTEB(
                                //         16.0, 0.0, 16.0, 0.0),
                                //     child: InkWell(
                                //       splashColor: Colors.transparent,
                                //       focusColor: Colors.transparent,
                                //       hoverColor: Colors.transparent,
                                //       highlightColor: Colors.transparent,
                                //       onTap: () async {
                                //         logFirebaseEvent(
                                //             'MAIN_PROFILE_Container_h7tyfdoi_ON_TAP');
                                //         if (MediaQuery.sizeOf(context).width >=
                                //             991.0) {
                                //           await showDialog(
                                //             barrierColor: Colors.transparent,
                                //             context: context,
                                //             builder: (dialogContext) {
                                //               return Dialog(
                                //                 elevation: 0,
                                //                 insetPadding: EdgeInsets.zero,
                                //                 backgroundColor:
                                //                     Colors.transparent,
                                //                 alignment: const AlignmentDirectional(
                                //                         0.0, 0.0)
                                //                     .resolve(Directionality.of(
                                //                         context)),
                                //                 child: const ModalProfileEditWidget(),
                                //               );
                                //             },
                                //           );
                                //         } else {
                                //           context.pushNamed('editProfile');
                                //         }
                                //       },
                                //       child: AnimatedContainer(
                                //         duration: const Duration(milliseconds: 100),
                                //         curve: Curves.easeInOut,
                                //         width: double.infinity,
                                //         height: 60.0,
                                //         constraints: const BoxConstraints(
                                //           minHeight: 70.0,
                                //         ),
                                //         decoration: BoxDecoration(
                                //           color: FlutterFlowTheme.of(context)
                                //               .secondaryBackground,
                                //           boxShadow: const [
                                //             BoxShadow(
                                //               blurRadius: 3.0,
                                //               color: Color(0x33000000),
                                //               offset: Offset(
                                //                 0.0,
                                //                 1.0,
                                //               ),
                                //             )
                                //           ],
                                //           borderRadius:
                                //               BorderRadius.circular(12.0),
                                //           border: Border.all(
                                //             color: FlutterFlowTheme.of(context)
                                //                 .alternate,
                                //             width: 1.0,
                                //           ),
                                //         ),
                                //         child: Padding(
                                //           padding:
                                //               const EdgeInsetsDirectional.fromSTEB(
                                //                   8.0, 8.0, 16.0, 8.0),
                                //           child: Row(
                                //             mainAxisSize: MainAxisSize.max,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsetsDirectional
                                //                     .fromSTEB(
                                //                         12.0, 0.0, 0.0, 0.0),
                                //                 child: Text(
                                //                   FFLocalizations.of(context)
                                //                       .getText(
                                //                     'b1lw0hfu' /* Edit Profile */,
                                //                   ),
                                //                   style: FlutterFlowTheme.of(
                                //                           context)
                                //                       .labelLarge
                                //                       .override(
                                //                         fontFamily:
                                //                             'Plus Jakarta Sans',
                                //                         letterSpacing: 0.0,
                                //                       ),
                                //                 ),
                                //               ),
                                //               Align(
                                //                 alignment: const AlignmentDirectional(
                                //                     0.9, 0.0),
                                //                 child: Icon(
                                //                   Icons.arrow_forward_ios,
                                //                   color: FlutterFlowTheme.of(
                                //                           context)
                                //                       .secondaryText,
                                //                   size: 18.0,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.fromSTEB(
                                //       16.0, 0.0, 16.0, 0.0),
                                //   child: FlutterFlowLanguageSelector(
                                //     width: double.infinity,
                                //     height: 60.0,
                                //     backgroundColor:
                                //         FlutterFlowTheme.of(context)
                                //             .secondaryBackground,
                                //     borderColor:
                                //         FlutterFlowTheme.of(context).alternate,
                                //     dropdownColor: FlutterFlowTheme.of(context)
                                //         .secondaryBackground,
                                //     dropdownIconColor:
                                //         FlutterFlowTheme.of(context)
                                //             .secondaryText,
                                //     borderRadius: 12.0,
                                //     textStyle: FlutterFlowTheme.of(context)
                                //         .bodyLarge
                                //         .override(
                                //           fontFamily: 'Plus Jakarta Sans',
                                //           letterSpacing: 0.0,
                                //         ),
                                //     hideFlags: false,
                                //     flagSize: 24.0,
                                //     flagTextGap: 8.0,
                                //     currentLanguage: FFLocalizations.of(context)
                                //         .languageCode,
                                //     languages: FFLocalizations.languages(),
                                //     onChanged: (lang) =>
                                //         setAppLanguage(context, lang),
                                //   ),
                                // ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      constraints: const BoxConstraints(
                                        minHeight: 70.0,
                                        maxWidth: 770.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Escolhar a cor que deseja",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text("",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 16.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    SizedBox(
                                                      width: 322.0,
                                                      child: Stack(
                                                        children: [
                                                          AnimatedContainer(
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    150),
                                                            curve: Curves
                                                                .easeInOut,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  // logFirebaseEvent(
                                                                  //     'MAIN_PROFILE_Container_nj6nvadb_ON_TAP');
                                                                  setDarkModeSetting(
                                                                      context,
                                                                      ThemeMode
                                                                          .dark);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 310.0,
                                                                  height: 230.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFF1B1D27),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Text(
                                                                                  "Modo Escuro",
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (Theme.of(context).brightness == Brightness.dark)
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                                                                  child: Icon(
                                                                                    Icons.check_circle_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 32.0,
                                                                                  ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              110.0,
                                                                          height:
                                                                              160.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0xFF2A3137),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                12.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 70.0,
                                                                                        height: 20.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xD81D2429),
                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 16.0,
                                                                                        height: 16.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 44.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xD81D2429),
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 44.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xD81D2429),
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 322.0,
                                                      child: Stack(
                                                        children: [
                                                          AnimatedContainer(
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    150),
                                                            curve: Curves
                                                                .easeInOut,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .light
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  // logFirebaseEvent(
                                                                  //     'MAIN_PROFILE_Container_dvfw21hn_ON_TAP');
                                                                  setDarkModeSetting(
                                                                      context,
                                                                      ThemeMode
                                                                          .light);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 310.0,
                                                                  height: 230.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Text("Modo Claro",
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: const Color(0xFF1B1D27),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (Theme.of(context).brightness == Brightness.light)
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                                                                  child: Icon(
                                                                                    Icons.check_circle_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 32.0,
                                                                                  ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              110.0,
                                                                          height:
                                                                              160.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0xFFDBE2E7),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                12.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 70.0,
                                                                                        height: 20.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 16.0,
                                                                                        height: 16.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 44.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 44.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          // logFirebaseEvent(
                                          //     'MAIN_PROFILE_LOG_OUT_BTN_ON_TAP');

                                          context.pushNamed(
                                            'auth_Login',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 250),
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            "Sair",
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          hoverElevation: 3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(height: 16.0))
                                  .addToEnd(const SizedBox(height: 64.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
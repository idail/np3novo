import 'package:np3novo/main.dart';

import '../../main_pages/main_home/main_home_widget.dart';
import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_login_model.dart';
import 'package:http/http.dart' as http;

class AuthLoginWidget extends StatefulWidget {
  const AuthLoginWidget({super.key});

  @override
  State<AuthLoginWidget> createState() => _AuthLoginWidgetState();
}

class _AuthLoginWidgetState extends State<AuthLoginWidget>
    with TickerProviderStateMixin {
  late AuthLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  var usuariotext = TextEditingController();
  var senhatext = TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthLoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'auth_Login'});
    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
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
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.9, 0.9),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
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
            begin: const Offset(0.0, 40.0),
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
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.7, 0.7),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 700.ms),
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 700.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.4, 0.4),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 900.ms),
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.4, 0.4),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
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

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void mostrarAlerta(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> logar(String usuario, String senha) async {
    var uri = Uri.parse(
        "http://192.168.100.6/np3beneficios_appphp/api/autenticacao/autenticacao.php?usuario=$usuario&senha=$senha");
    var resposta = await http.get(uri, headers: {"Accept": "application/json"});
    print(resposta.body);
    var retorno = jsonDecode(resposta.body);

    if(retorno == "nenhum usuario localizado"){
      //mostrarAlerta("Informação", "Favor verificar os dados preenchidos");
    }else{
    int codigo_departamento_fornecedor;
    var nome_grupo = retorno["nome_grupo_usuario"];
    var nome_usuario = retorno["nome"];
    var login_usuario = retorno["login_usuario"];
    String codigo_usuario =
        retorno["codigo_usuario_autenticado"].toString();

    if (retorno["codigo_departamento_fornecedor"] != null &&
        retorno["codigo_departamento_fornecedor"].toString().isNotEmpty) {
      codigo_departamento_fornecedor = int.parse(retorno["codigo_departamento_fornecedor"]);
      print(codigo_departamento_fornecedor);
    }else{
      codigo_departamento_fornecedor = 0;
    }

    var email_usuario = "";

    if(retorno["email_usuario"].toString().isNotEmpty && retorno["email_usuario"] != null)
      email_usuario = retorno["email_usuario"];

    try {
       String tipoAcesso = await verificaLogin(nome_grupo);

      //MyApp(perfilacesso:tipoAcesso);
      //AppStateNotifier();
      //NavBarPage();

      context.pushNamed('Main_Home',pathParameters: {"tipoacesso":tipoAcesso,"nomeusuario":nome_usuario,"usuario_codigo":codigo_usuario});

      // if (tipoAcesso == "gestor") {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Abas(
      //         tipoAcesso: tipoAcesso,
      //         nomeUsuario: nome_usuario,
      //         usuario_codigo: codigo_usuario,
      //         codigo_departamento_fornecedor: 0,
      //         login_usuario:login_usuario,
      //         email_usuario:email_usuario,
      //       ),
      //     ),
      //   );
      // } else {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Abas(
      //         tipoAcesso: tipoAcesso,
      //         nomeUsuario: nome_usuario,
      //         usuario_codigo: codigo_usuario,
      //         codigo_departamento_fornecedor: codigo_departamento_fornecedor,
      //         login_usuario: login_usuario,
      //         email_usuario: email_usuario,
      //       ),
      //     ),
      //   );
      // }
    } catch (e) {
      print('Erro durante a autenticação: $e');
    } 
    }
  }

  Future<String> verificaLogin(String dado) async {
    if (dado == "Fornecedor") {
      return "fornecedor";
    } else {
      return "gestor";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).accent1,
                FlutterFlowTheme.of(context).primary
              ],
              stops: const [0.3, 1.0],
              begin: const AlignmentDirectional(1.0, -1.0),
              end: const AlignmentDirectional(-1.0, 1.0),
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 530.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.mainLogoSmallModel,
                                    updateCallback: () => setState(() {}),
                                    child: const MainLogoSmallWidget(),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation1']!),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '3p97u62u' /* Welcome Back! */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'xkz4xjo6' /* Use the form below to access y... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:usuariotext,
                                      focusNode: _model.emailAddressFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            "Usuário",
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            "Informe seu usuario",
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .emailAddressTextControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation1']!),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: senhatext,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: true,
                                      autofillHints: const [AutofillHints.password],
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText:"Senha",
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:"Informa sua senha",
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation2']!),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // FFButtonWidget(
                                  //   onPressed: () async {
                                  //     logFirebaseEvent(
                                  //         'AUTH_LOGIN_Button-ForgotPassword_ON_TAP');

                                  //     context.pushNamed('forgotPassword');
                                  //   },
                                  //   text: FFLocalizations.of(context).getText(
                                  //     's8bicxzh' /* Forgot Password? */,
                                  //   ),
                                  //   options: FFButtonOptions(
                                  //     width: 170.0,
                                  //     height: 40.0,
                                  //     padding: const EdgeInsetsDirectional.fromSTEB(
                                  //         0.0, 0.0, 0.0, 0.0),
                                  //     iconPadding:
                                  //         const EdgeInsetsDirectional.fromSTEB(
                                  //             0.0, 0.0, 0.0, 0.0),
                                  //     color: const Color(0x00FFFFFF),
                                  //     textStyle: FlutterFlowTheme.of(context)
                                  //         .labelMedium
                                  //         .override(
                                  //           fontFamily: 'Plus Jakarta Sans',
                                  //           letterSpacing: 0.0,
                                  //         ),
                                  //     elevation: 0.0,
                                  //     borderSide: const BorderSide(
                                  //       color: Colors.transparent,
                                  //       width: 1.0,
                                  //     ),
                                  //   ),
                                  // ).animateOnPageLoad(animationsMap[
                                  //     'buttonOnPageLoadAnimation1']!),

                                  // This button does the login flow
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'AUTH_LOGIN_PAGE_Button-Login_ON_TAP');

                                      if (usuariotext.text.isEmpty || senhatext.text.isEmpty) {
                                        mostrarAlerta("Campos obrigatórios", "Por favor, preencha o usuário e a senha.");
                                      } else {
                                        logar(usuariotext.text, senhatext.text);
                                      }
                                    },
                                    text: "Logar",
                                    options: FFButtonOptions(
                                      height: 52.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          44.0, 0.0, 44.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      hoverColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      hoverElevation: 0.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation2']!),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation2']!),
                            ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 24.0, 0.0, 0.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       AutoSizeText(
                            //         FFLocalizations.of(context).getText(
                            //           'zy328lg7' /* Use a social platform to conti... */,
                            //         ),
                            //         textAlign: TextAlign.center,
                            //         style: FlutterFlowTheme.of(context)
                            //             .labelMedium
                            //             .override(
                            //               fontFamily: 'Plus Jakarta Sans',
                            //               letterSpacing: 0.0,
                            //             ),
                            //       ),
                            //     ],
                            //   ).animateOnPageLoad(
                            //       animationsMap['rowOnPageLoadAnimation3']!),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: InkWell(
                            //           splashColor: Colors.transparent,
                            //           focusColor: Colors.transparent,
                            //           hoverColor: Colors.transparent,
                            //           highlightColor: Colors.transparent,
                            //           onTap: () async {
                            //             logFirebaseEvent(
                            //                 'AUTH_LOGIN_Container_fxshfyvv_ON_TAP');
                            //             //GoRouter.of(context).prepareAuthEvent();
                            //             // final user = await authManager
                            //             //     .signInWithGoogle(context);
                            //             // if (user == null) {
                            //             //   return;
                            //             // }

                            //             // context.goNamedAuth(
                            //             //     'Main_Home', context.mounted);
                            //           },
                            //           child: Container(
                            //             width: 50.0,
                            //             height: 50.0,
                            //             decoration: BoxDecoration(
                            //               color: FlutterFlowTheme.of(context)
                            //                   .accent1,
                            //               shape: BoxShape.circle,
                            //               border: Border.all(
                            //                 color: FlutterFlowTheme.of(context)
                            //                     .primary,
                            //                 width: 2.0,
                            //               ),
                            //             ),
                            //             alignment:
                            //                 const AlignmentDirectional(0.0, 0.0),
                            //             child: FaIcon(
                            //               FontAwesomeIcons.google,
                            //               color: FlutterFlowTheme.of(context)
                            //                   .primaryText,
                            //               size: 24.0,
                            //             ),
                            //           ),
                            //         ).animateOnPageLoad(animationsMap[
                            //             'containerOnPageLoadAnimation1']!),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: InkWell(
                            //           splashColor: Colors.transparent,
                            //           focusColor: Colors.transparent,
                            //           hoverColor: Colors.transparent,
                            //           highlightColor: Colors.transparent,
                            //           onTap: () async {
                            //             logFirebaseEvent(
                            //                 'AUTH_LOGIN_Container_peswewg7_ON_TAP');
                            //             //GoRouter.of(context).prepareAuthEvent();
                            //             // final user = await authManager
                            //             //     .signInWithApple(context);
                            //             // if (user == null) {
                            //             //   return;
                            //             // }

                            //             // context.goNamedAuth(
                            //             //     'Main_Home', context.mounted);
                            //           },
                            //           child: Container(
                            //             width: 50.0,
                            //             height: 50.0,
                            //             decoration: BoxDecoration(
                            //               color: FlutterFlowTheme.of(context)
                            //                   .accent1,
                            //               shape: BoxShape.circle,
                            //               border: Border.all(
                            //                 color: FlutterFlowTheme.of(context)
                            //                     .primary,
                            //                 width: 2.0,
                            //               ),
                            //             ),
                            //             alignment:
                            //                 const AlignmentDirectional(0.0, 0.0),
                            //             child: FaIcon(
                            //               FontAwesomeIcons.apple,
                            //               color: FlutterFlowTheme.of(context)
                            //                   .primaryText,
                            //               size: 24.0,
                            //             ),
                            //           ),
                            //         ).animateOnPageLoad(animationsMap[
                            //             'containerOnPageLoadAnimation2']!),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 24.0, 0.0, 24.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text(
                            //         FFLocalizations.of(context).getText(
                            //           'tcu0c8bu' /* Don't have an account? */,
                            //         ),
                            //         style: FlutterFlowTheme.of(context)
                            //             .labelMedium
                            //             .override(
                            //               fontFamily: 'Plus Jakarta Sans',
                            //               letterSpacing: 0.0,
                            //             ),
                            //       ),
                            //       FFButtonWidget(
                            //         onPressed: () async {
                            //           logFirebaseEvent(
                            //               'AUTH_LOGIN_CREATE_ACCOUNT_BTN_ON_TAP');

                            //           context.pushNamed(
                            //             'auth_Create',
                            //             extra: <String, dynamic>{
                            //               kTransitionInfoKey: const TransitionInfo(
                            //                 hasTransition: true,
                            //                 transitionType:
                            //                     PageTransitionType.fade,
                            //                 duration: Duration(milliseconds: 0),
                            //               ),
                            //             },
                            //           );
                            //         },
                            //         text: FFLocalizations.of(context).getText(
                            //           'kk2rdqi2' /* Create Account */,
                            //         ),
                            //         options: FFButtonOptions(
                            //           width: 130.0,
                            //           height: 30.0,
                            //           padding: const EdgeInsetsDirectional.fromSTEB(
                            //               0.0, 0.0, 0.0, 0.0),
                            //           iconPadding:
                            //               const EdgeInsetsDirectional.fromSTEB(
                            //                   0.0, 0.0, 0.0, 0.0),
                            //           color: const Color(0x00FFFFFF),
                            //           textStyle: FlutterFlowTheme.of(context)
                            //               .bodyMedium
                            //               .override(
                            //                 fontFamily: 'Plus Jakarta Sans',
                            //                 letterSpacing: 0.0,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //           elevation: 0.0,
                            //           borderSide: const BorderSide(
                            //             color: Colors.transparent,
                            //             width: 1.0,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ).animateOnPageLoad(
                            //       animationsMap['rowOnPageLoadAnimation4']!),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
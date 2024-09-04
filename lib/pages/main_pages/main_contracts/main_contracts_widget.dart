import 'dart:convert';

import '/components/modal_sections/modal_project_details/modal_project_details_widget.dart';
import '/components/modals/command_palette/command_palette_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_contracts_model.dart';
export 'main_contracts_model.dart';
import 'package:http/http.dart' as http;

class MainContractsWidget extends StatefulWidget {
  final String? tipo_acesso;
  final int? usuariocodigo;
  const MainContractsWidget({super.key, this.usuariocodigo, this.tipo_acesso});

  @override
  State<MainContractsWidget> createState() => _MainContractsWidgetState();
}

class _MainContractsWidgetState extends State<MainContractsWidget>
    with TickerProviderStateMixin {
  late MainContractsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  // Variáveis para armazenar os pedidos e o estado da paginação
  List<Map<String, dynamic>> pedidos = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainContractsModel());
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main_Contracts'});
    animationsMap.addAll({
      // Animations...
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => loadPedidos());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Função para carregar pedidos da API e atualizar o estado
  Future<void> loadPedidos() async {
    var uri = Uri.parse(
        "http://192.168.15.200/np3beneficios_appphp/api/pedidos/busca_pedidos.php?codigo_usuario=${widget.usuariocodigo}&tipo_acesso=${widget.tipo_acesso}");
    var resposta = await http.get(uri, headers: {"Accept": "application/json"});
    List<dynamic> data = json.decode(resposta.body);
    setState(() {
      pedidos = List<Map<String, dynamic>>.from(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define o número de itens por página
    final int itemsPerPage = 3;
    final int totalPages = (pedidos.length / itemsPerPage).ceil();

    // Pega os itens da página atual
    final itemsOnPage = pedidos.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: !isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  "Pedidos",
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 44),
                itemCount: itemsOnPage.length,
                itemBuilder: (context, index) {
                  final item = itemsOnPage[index];
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 70.0,
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Código: ${item['id']}', // Código do pedido
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Descrição: ${item['descricaopedido']}', // Descrição do pedido
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Email: idaillopes@gmail.com', // Email do cliente
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Data: ${item['dt_pedido']}', // Data do pedido
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'Valor Cotação: ${item['valor_total_cotacao']}', // Valor da cotação
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status: ${item['estado_pedido']}', // Status do pedido
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                InkWell(
                                  onTap: () {
                                    // Ação ao clicar no botão "Entregar"
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional.center,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        'Entregar', // Texto do botão
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Navegação de Páginas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 0
                        ? () {
                            setState(() {
                              currentPage--;
                            });
                          }
                        : null,
                    child: Text('Anterior'),
                  ),
                  Text('Página ${currentPage + 1} de $totalPages'),
                  ElevatedButton(
                    onPressed: currentPage < totalPages - 1
                        ? () {
                            setState(() {
                              currentPage++;
                            });
                          }
                        : null,
                    child: Text('Próxima'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

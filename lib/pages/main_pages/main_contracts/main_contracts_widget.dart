import 'dart:convert';
import 'dart:math';

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
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MainContractsWidget extends StatefulWidget {
  final String? tipo_acesso;
  final int? usuariocodigo;
  final int? codigo_departamento_fornecedor;
  final String? email_usuario;
  final String? login_usuario;
  final String? nome_usuario;

  const MainContractsWidget({super.key, this.usuariocodigo, this.tipo_acesso, this.codigo_departamento_fornecedor , this.email_usuario , this.login_usuario , this.nome_usuario});

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
  String texto = '';
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

    if(widget.tipo_acesso == "gestor")
    {
      var uri = Uri.parse(
        "http://192.168.100.6/np3beneficios_appphp/api/pedidos/busca_pedidos.php?codigo_usuario=${widget.usuariocodigo}&tipo_acesso=${widget.tipo_acesso}");
      var resposta = await http.get(uri, headers: {"Accept": "application/json"});
      List<dynamic> data = json.decode(resposta.body);

      setState(() {
        pedidos = List<Map<String, dynamic>>.from(data);
      });
    }else{
      var uri = Uri.parse(
        "http://192.168.100.6/np3beneficios_appphp/api/pedidos/busca_pedidos.php?codigo_usuario=${widget.usuariocodigo}&tipo_acesso=${widget.tipo_acesso}&codigo_fornecedor_departamento=${widget.codigo_departamento_fornecedor}");
      var resposta = await http.get(uri, headers: {"Accept": "application/json"});

      List<dynamic> data = json.decode(resposta.body);

      setState(() {
          pedidos = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  Future<void> LerPedido() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    if (code != '-1') {
      setState(() {
        texto = code;
        mostrarAlerta("Informação", texto);
      });
    } else {
      setState(() {
        texto = 'Leitura de QR Code cancelada';
        print(texto);
      });
    }
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
                  "Pedidos - ${widget.tipo_acesso}",
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
                  String status = item["estado_pedido"];
                  Color statusColor;
                  switch (status) {
                    case 'Pendente':
                      statusColor = Colors.red;
                      break;
                    case 'Em Andamento':
                      statusColor = Colors.blue;
                      break;
                    case 'Concluído':
                      statusColor = Colors.green;
                      break;
                    default:
                      statusColor = Colors.blue;
                  }

                  DateTime data = DateTime.parse(item['dt_pedido']);
                  String dataFormatadaBR = DateFormat('dd/MM/yyyy').format(data);

                  String? recebeEmail = "";
                  
                  if(widget.email_usuario != "nada"){
                    recebeEmail = widget.email_usuario;
                  }

                  String? recebeNomeUsuario = widget.nome_usuario;

                  String? recebeLoginUsuario = widget.login_usuario;

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
                        color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.tipo_acesso == 'gestor') ...[
                              Text(
                                'Código: ${item['id']}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Descrição: ${item['descricaopedido']}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Nome: $recebeNomeUsuario',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Data: $dataFormatadaBR',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'Valor Cotação: R\$${item['valor_total_cotacao']}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Status: ${status}',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: statusColor),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      LerPedido();
                                    },
                                    child: Container(
                                      height: 45.0,
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
                                          'Entregar',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ] else if (widget.tipo_acesso == 'fornecedor') ...[
                              Text(
                                'Código: ${item['id']}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Descrição: ${item['descricaopedido']}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Usuário: $recebeLoginUsuario',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'Data: $dataFormatadaBR',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              // Text(
                              //   'Status: ${status}',
                              //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: statusColor),
                              // ),
                              // Text(
                              //   'Valor Pedido: ${item['valor_pedido']}',
                              //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              //         color: Theme.of(context).primaryColor,
                              //       ),
                              // ),
                              Text(
                                'Valor Cotação: ${item['valor_total_cotacao']}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Status: ${status}',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: statusColor),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      LerPedido();
                                    },
                                    child: Container(
                                      height: 45.0,
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
                                          'Entregar',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
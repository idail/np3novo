// import 'package:flutter/material.dart';

// class PaginatedListView extends StatefulWidget {
//   final List<Map<String, String>> items;

//   const PaginatedListView({Key? key, required this.items}) : super(key: key);

//   @override
//   _PaginatedListViewState createState() => _PaginatedListViewState();
// }



// class _PaginatedListViewState extends State<PaginatedListView> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     // Define o número de itens por página
//     final int itemsPerPage = 3;
//     final int totalPages = (widget.items.length / itemsPerPage).ceil();

//     // Pega os itens da página atual
//     final itemsOnPage = widget.items.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             padding: const EdgeInsets.fromLTRB(0, 12, 0, 44),
//             itemCount: itemsOnPage.length,
//             itemBuilder: (context, index) {
//               final item = itemsOnPage[index];
//               return Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 100),
//                   curve: Curves.easeInOut,
//                   width: double.infinity,
//                   constraints: const BoxConstraints(
//                     minHeight: 70.0,
//                     maxWidth: 770.0,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).secondaryHeaderColor,
//                     boxShadow: const [
//                       BoxShadow(
//                         blurRadius: 3.0,
//                         color: Color(0x33000000),
//                         offset: Offset(0.0, 1.0),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(12.0),
//                     border: Border.all(
//                       color: Theme.of(context).accentColor,
//                       width: 1.0,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Código: ${item['codigo']}', // Código do pedido
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                         Text(
//                           'Descrição: ${item['descricao']}', // Descrição do pedido
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         Text(
//                           'Email: ${item['email']}', // Email do cliente
//                           style: Theme.of(context).textTheme.subtitle2,
//                         ),
//                         Text(
//                           'Data: ${item['data']}', // Data do pedido
//                           style: Theme.of(context).textTheme.bodyText1,
//                         ),
//                         Text(
//                           'Valor Cotação: ${item['valorCotacao']}', // Valor da cotação
//                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Status: ${item['status']}', // Status do pedido
//                               style: Theme.of(context).textTheme.bodyText1,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Ação ao clicar no botão "Entregar"
//                               },
//                               child: Container(
//                                 height: 32.0,
//                                 decoration: BoxDecoration(
//                                   color: Theme.of(context).accentColor,
//                                   borderRadius: BorderRadius.circular(12.0),
//                                   border: Border.all(
//                                     color: Theme.of(context).primaryColor,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                                 alignment: AlignmentDirectional.center,
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
//                                   child: Text(
//                                     'Entregar', // Texto do botão
//                                     style: Theme.of(context).textTheme.bodyText1,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         // Navegação de Páginas
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: currentPage > 0
//                   ? () {
//                       setState(() {
//                         currentPage--;
//                       });
//                     }
//                   : null,
//               child: const Text('Anterior'),
//             ),
//             Text('Página ${currentPage + 1} de $totalPages'),
//             ElevatedButton(
//               onPressed: currentPage < totalPages - 1
//                   ? () {
//                       setState(() {
//                         currentPage++;
//                       });
//                     }
//                   : null,
//               child: const Text('Próxima'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
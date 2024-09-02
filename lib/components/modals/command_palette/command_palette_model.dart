import '/flutter_flow/flutter_flow_util.dart';
import 'command_palette_widget.dart' show CommandPaletteWidget;
import 'package:flutter/material.dart';

class CommandPaletteModel extends FlutterFlowModel<CommandPaletteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'modal_share_project_widget.dart' show ModalShareProjectWidget;
import 'package:flutter/material.dart';

class ModalShareProjectModel extends FlutterFlowModel<ModalShareProjectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for iuser widget.
  bool iuserHovered1 = false;
  // State field(s) for iuser widget.
  bool iuserHovered2 = false;
  // State field(s) for iuser widget.
  bool iuserHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();
  }
}

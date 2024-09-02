import '/flutter_flow/flutter_flow_util.dart';
import 'create_comment_widget.dart' show CreateCommentWidget;
import 'package:flutter/material.dart';

class CreateCommentModel extends FlutterFlowModel<CreateCommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioTextController;
  String? Function(BuildContext, String?)? shortBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortBioFocusNode?.dispose();
    shortBioTextController?.dispose();
  }
}

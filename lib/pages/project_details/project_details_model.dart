import '/components/modal_sections/project_details_alt/project_details_alt_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'project_details_widget.dart' show ProjectDetailsWidget;
import 'package:flutter/material.dart';

class ProjectDetailsModel extends FlutterFlowModel<ProjectDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for projectDetails_alt component.
  late ProjectDetailsAltModel projectDetailsAltModel;

  @override
  void initState(BuildContext context) {
    projectDetailsAltModel =
        createModel(context, () => ProjectDetailsAltModel());
  }

  @override
  void dispose() {
    projectDetailsAltModel.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'project_details_alt_widget.dart' show ProjectDetailsAltWidget;
import 'package:flutter/material.dart';

class ProjectDetailsAltModel extends FlutterFlowModel<ProjectDetailsAltWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}

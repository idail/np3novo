import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_success_widget.dart' show ModalSuccessWidget;
import 'package:flutter/material.dart';

class ModalSuccessModel extends FlutterFlowModel<ModalSuccessWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for main_Logo_Small component.
  late MainLogoSmallModel mainLogoSmallModel;

  @override
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
  }

  @override
  void dispose() {
    mainLogoSmallModel.dispose();
  }
}

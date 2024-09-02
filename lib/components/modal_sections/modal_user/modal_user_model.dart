import '/components/modal_sections/user_details_main/user_details_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_user_widget.dart' show ModalUserWidget;
import 'package:flutter/material.dart';

class ModalUserModel extends FlutterFlowModel<ModalUserWidget> {
  ///  Local state fields for this component.

  bool? showBack = false;

  ///  State fields for stateful widgets in this component.

  // Model for user_Details_main component.
  late UserDetailsMainModel userDetailsMainModel;

  @override
  void initState(BuildContext context) {
    userDetailsMainModel = createModel(context, () => UserDetailsMainModel());
  }

  @override
  void dispose() {
    userDetailsMainModel.dispose();
  }
}

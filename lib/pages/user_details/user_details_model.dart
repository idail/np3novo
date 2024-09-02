import '/components/modal_sections/user_details_main/user_details_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:flutter/material.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  State fields for stateful widgets in this page.

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

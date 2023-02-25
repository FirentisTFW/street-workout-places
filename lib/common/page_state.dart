import 'package:app/common/global_blocs_mixin.dart';
import 'package:app/widgets/app_progress_indicator.dart';
import 'package:flutter/material.dart';

abstract class PageState<W extends StatefulWidget> extends State<W> with GlobalBlocsMixin {
  @override
  void initState() {
    super.initState();
    fetchBaseData();
  }

  @protected
  void fetchBaseData() {
    // Override if needed.
  }

  @protected
  Widget buildEmptyBody() {
    return const SizedBox.shrink();
  }

  @protected
  Widget buildLoadingBody() {
    return const AppProgressIndicator();
  }
}

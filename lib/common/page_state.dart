import 'package:app/common/global_blocs_mixin.dart';
import 'package:app/errors/ui_error.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:app/widgets/app_progress_indicator.dart';
import 'package:app/widgets/space.dart';
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

  Widget buildFullPageErrorBody(
    ContainerError error, {
    required VoidCallback onRetryPressed,
  }) {
    // TODO Remove hardcoded texts, update and style error body
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Wystąpił błąd. Spróbuj ponownie'),
        const Space.vertical(20.0),
        AdaptiveButton(
          onPressed: onRetryPressed,
          child: const Text('Spróbuj ponownie'),
        ),
      ],
    );
  }

  @protected
  Widget buildLoadingBody() {
    return const AppProgressIndicator();
  }
}

import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/presentation/pages/home/home_cubit.dart';
import 'package:app/presentation/pages/home/home_widget_factory.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/widgets/error_view_big.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BlocPageState<HomePage, HomeCubit> {
  @override
  void initState() {
    super.initState();
    bloc.fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) {
            return switch (state) {
              final HomeFetchInProgress _ => buildLoadingBody(),
              final HomeFetchFailure state => ErrorViewBig(
                  error: state.error,
                  onRetryPressed: bloc.fetchSections,
                ),
              final HomeFetchSuccess state => _buildLoadedBody(state),
              _ => buildEmptyBody(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildLoadedBody(HomeFetchSuccess state) {
    return ListView.separated(
      itemBuilder: (_, index) => HomeWidgetFactory.widgetFromSection(state.sections[index]),
      itemCount: state.sections.length,
      padding: AppPadding.defaultVertical,
      separatorBuilder: (_, __) => const Space.vertical(10.0),
    );
  }
}

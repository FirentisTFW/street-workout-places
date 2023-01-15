import 'package:app/blocs/spots/spots_bloc.dart';
import 'package:app/common/bloc_page_state.dart';
import 'package:app/common/text_field_essentials.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/page_tab_bar_button_data.dart';
import 'package:app/pages/spots/spots_page_tab.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/page_tab_bar/page_tab_bar.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class SpotsPage extends StatefulWidget {
  const SpotsPage({
    super.key,
  });

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends BlocPageState<SpotsPage, SpotsBloc> {
  final TextFieldEssentials _searchTFE = TextFieldEssentials();
  final ValueNotifier<SpotsPageTab> _tabNotifier = ValueNotifier(SpotsPageTab.map);

  @override
  void dispose() {
    _tabNotifier.dispose();
    _searchTFE.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildSearchBar(),
              const Space.vertical(30.0),
              _buildTabBar(),
              _buildPageView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    // TODO Implemen onChange - filter locations by name
    return AppTextField(
      _searchTFE,
      labelText: S.of(context).search,
    );
  }

  Widget _buildTabBar() {
    return ValueListenableBuilder<SpotsPageTab>(
      valueListenable: _tabNotifier,
      builder: (context, selectedTab, _) {
        return PageTabBar(
          buttonsData: [
            PageTabBarButtonData(
              title: S.of(context).spotsMapTabBarButtonTitle,
              onPressed: () => _tabNotifier.value = SpotsPageTab.map,
            ),
            PageTabBarButtonData(
              title: S.of(context).spotsListTabBarButtonTitle,
              onPressed: () => _tabNotifier.value = SpotsPageTab.list,
            ),
          ],
          selectedButtonIndex: selectedTab.tabBarButtonIndex,
        );
      },
    );
  }

  Widget _buildPageView() {
    return const SizedBox.shrink();
  }
}

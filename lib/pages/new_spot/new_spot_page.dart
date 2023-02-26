import 'package:app/common/bloc_page_state.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/styles/app_padding.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class NewSpotPage extends StatefulWidget {
  const NewSpotPage({
    super.key,
  });

  @override
  State<NewSpotPage> createState() => _NewSpotPageState();
}

class _NewSpotPageState extends BlocPageState<NewSpotPage, NewSpotCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.defaultAll,
          child: ListView(
            children: [
              _buildNameTextField(),
              // _buildSizeSelector(),
              // _buildSurfaceSelector(),
              // _buildCoordinatesSection(),
              // _buildAddressSection(),
              // _buildDescriptionTextField(),
            ].separatedBy(
              const Space.horizontal(20.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return AppTextField(
      bloc.nameTFE,
      labelText: 'Nazwa',
    );
  }
}

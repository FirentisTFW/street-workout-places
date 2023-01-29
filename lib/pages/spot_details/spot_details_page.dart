import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/spot_details/spot_details_bloc.dart';
import 'package:flutter/material.dart';

class SpotDetailsPage extends StatefulWidget {
  const SpotDetailsPage();

  @override
  State<SpotDetailsPage> createState() => _SpotDetailsPageState();
}

class _SpotDetailsPageState extends BlocPageState<SpotDetailsPage, SpotDetailsBloc> {
  @override
  Widget build(BuildContext context) {
    // FIXME Uncomment and Implement
    return Scaffold(
      body: Column(
        children: [
          // _buildImageSlider(),
          // _buildNameAndAddressSection(),
          // _buildDescription(),
          // _buildEquipment(),
          // _buildReviews(),
        ],
      ),
    );
  }
}

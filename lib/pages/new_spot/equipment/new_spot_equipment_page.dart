import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:flutter/material.dart';

class NewSpotEquipmentPage extends StatefulWidget {
  const NewSpotEquipmentPage({
    super.key,
  });

  @override
  State<NewSpotEquipmentPage> createState() => _NewSpotEquipmentPageState();
}

class _NewSpotEquipmentPageState extends BlocPageState<NewSpotEquipmentPage, NewSpotEquipmentCubit> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

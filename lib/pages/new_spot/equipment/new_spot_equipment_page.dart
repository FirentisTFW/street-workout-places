import 'package:app/common/bloc_page_state.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/equipment.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:app/pages/new_spot/equipment/widgets/equipment_cell.dart';
import 'package:app/styles/app_padding.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/utils/alert_dialog_utils.dart';
import 'package:app/widgets/app_app_bar.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.defaultAll,
          child: Column(
            children: [
              _buildHeadline(),
              const Space.vertical(20.0),
              _buildSelectableEquipment(),
              const Space.vertical(20.0),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppAppBar(
      title: S.of(context).newSpotEquipmentAppBarTitle,
    );
  }

  Widget _buildHeadline() {
    return Text(
      S.of(context).newSpotEquipmentHeadline,
      style: AppTextStyles.contentBiggerMultiline(),
    );
  }

  Widget _buildSelectableEquipment() {
    return BlocBuilder<NewSpotEquipmentCubit, NewSpotEquipmentState>(
      builder: (_, state) {
        return state.map(
          initial: (state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final Equipment equipment = state.equipment[index];
                final ValueNotifier<bool>? notifier = bloc.equipmentNotifiers[equipment];
                if (notifier == null) return const SizedBox.shrink();
                return EquipmentCell(
                  equipment,
                  onToggled: () => bloc.equipmentNotifiers[equipment]?.toggle(),
                  isSelectedNotifier: notifier,
                );
              },
              itemCount: state.equipment.length,
              separatorBuilder: (_, __) => const Space.vertical(10.0),
            );
          },
        );
      },
    );
  }

  Widget _buildNextButton() {
    return PrimaryButton(
      S.of(context).next,
      onPressed: () {
        // FIXME Implement
        AlertDialogUtils.showContentUnavailable(context);
      },
    );
  }
}

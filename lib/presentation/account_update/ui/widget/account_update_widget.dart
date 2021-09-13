import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/model/users/users_model.dart';
import '../../../../generated/l10n.dart';
import '../../../common/common_variable.dart';
import '../../../common/widget/common_switch_list_tile.dart';
import '../../bloc/account_update_bloc.dart';

class AccountUpdateWidget extends StatefulWidget {
  const AccountUpdateWidget({
    Key? key,
    required this.usersModel,
  }) : super(key: key);
  final UsersModel usersModel;

  @override
  _AccountUpdateWidgetState createState() => _AccountUpdateWidgetState();
}

class _AccountUpdateWidgetState extends State<AccountUpdateWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAdmin = widget.usersModel.isAdmin;
    isActivated = widget.usersModel.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonSwitchListTile(
          title: S.current.permission,
          valueTextOn: admin,
          valueTextOff: user,
          icon: const Icon(
            Icons.admin_panel_settings_outlined,
          ),
          boolValue: isAdmin,
          activeColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.recoveredColor,
          inactiveTrackColor: AppColors.recoveredColorShade300,
          onChanged: (value) async {
            setState(() {
              isAdmin = !isAdmin;
            });
            context.read<AccountUpdateBloc>().add(
                  AccountUpdatePressedEvent(
                    isAdmin: isAdmin,
                    email: widget.usersModel.email,
                    isActive: widget.usersModel.isActive,
                    name: widget.usersModel.name,
                    uid: widget.usersModel.uid,
                  ),
                );
          },
        ),
        CommonSwitchListTile(
          title: S.current.active,
          valueTextOn: activated,
          valueTextOff: deactivated,
          icon: const Icon(Icons.title),
          boolValue: isActivated,
          inactiveThumbColor: AppColors.grey,
          inactiveTrackColor: AppColors.grey400,
          onChanged: (value) async {
            setState(() {
              isActivated = !isActivated;
            });
            context.read<AccountUpdateBloc>().add(
                  AccountUpdatePressedEvent(
                    isAdmin: widget.usersModel.isAdmin,
                    email: widget.usersModel.email,
                    isActive: isActivated,
                    name: widget.usersModel.name,
                    uid: widget.usersModel.uid,
                  ),
                );
          },
        ),
      ],
    );
  }
}

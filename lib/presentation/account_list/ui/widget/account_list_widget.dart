import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../common/common_variable.dart';
import '../../../common/method/common_show_dialog.dart';
import '../../bloc/account_list_bloc.dart';

class AccountListWidget extends StatefulWidget {
  const AccountListWidget({
    Key? key,
    required this.accountListLoadedState,
    required this.blocContext,
  }) : super(key: key);
  final AccountListLoadedState accountListLoadedState;
  final BuildContext blocContext;

  @override
  _AccountListWidgetState createState() => _AccountListWidgetState();
}

class _AccountListWidgetState extends State<AccountListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => InkWell(
        onTap: () => commonShowDialog(
          context: context,
          title1: S.current.edit,
          icon1: const Icon(
            Icons.edit,
          ),
          onTap1: () async {
            await Navigator.pushNamed(
              context,
              RouteDefine.accountUpdateScreen.name,
              arguments:
                  widget.accountListLoadedState.listUsers.elementAt(index),
            );
            Navigator.pop(context);
          },
          title2: S.current.delete,
          icon2: const Icon(
            Icons.delete,
          ),
          onTap2: () async {
            widget.blocContext.read<AccountListBloc>().add(
                  AccountListDeletePressedEvent(
                    email: widget.accountListLoadedState.listUsers
                        .elementAt(index)
                        .email,
                  ),
                );
            Navigator.pop(context);
          },
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            elevation: 2,
            child: ListTile(
              title: Text(
                  'Email: ${widget.accountListLoadedState.listUsers.elementAt(index).email}'),
              trailing: Text(
                widget.accountListLoadedState.listUsers
                            .elementAt(index)
                            .isAdmin ==
                        true
                    ? admin
                    : user,
              ),
            ),
          ),
        ),
      ),
      itemCount: widget.accountListLoadedState.listUsers.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/model/location/location_model.dart';
import '../../../../generated/l10n.dart';
import '../../../common/method/common_button.dart';
import '../../../common/method/sized_box_10h.dart';
import '../../bloc/detail_bloc.dart';

Center detailFailureWidget(DetailFailureState state, BuildContext context,
        LocationModel locationModel) =>
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.message),
            sizedBox10h(),
            commonElevatedButton(
              buttonColor: AppColors.kPrimaryColor,
              text: S.current.reload,
              onPressed: () {
                context.read<DetailBloc>().add(
                      DetailLoadEvent(
                        woeid: locationModel.woeid.toString(),
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );

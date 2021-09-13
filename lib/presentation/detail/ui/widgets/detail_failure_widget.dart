import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/model/location/location_model.dart';
import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../bloc/detail_bloc.dart';


class DetailFailureWidget extends StatelessWidget {
  const DetailFailureWidget({
    Key? key,
    required this.state,
    required this.locationModel,
  }) : super(key: key);

  final DetailFailureState state;
  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.message),
            SizedBox(
              height: 10.h,
            ),
            CommonElevatedButton(
              buttonColor: AppColors.primaryColor,
              text: S.current.reload,
              onPressed: () {
                context.read<DetailBloc>().add(
                      DetailLoadEvent(
                        woeid: locationModel.woeid,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/utils/shared_pref_manager.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../common/widget/back_app_bar_icon_button.dart';
import '../../../common/widget/fl_chart.dart';
import '../../../common/widget/information_widget.dart';
import '../../bloc/detail_bloc.dart';
import '../detail_screen.dart';

class DetailLoadedWidget extends StatefulWidget {
  const DetailLoadedWidget({
    Key? key,
    required this.state,
    required this.context,
    required this.detailArguments,
  }) : super(key: key);
  final BuildContext context;
  final DetailLoadedState state;
  final DetailArguments detailArguments;

  @override
  _DetailLoadedWidgetState createState() => _DetailLoadedWidgetState();
}

class _DetailLoadedWidgetState extends State<DetailLoadedWidget> {
  late bool isFavorite;

  User? user;

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = widget.detailArguments.favoritesModel?.favorite ?? false;
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        actions: [
          user != null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    context.read<DetailBloc>().add(
                          DetailFavoriteButtonPressedEvent(
                            woeid: widget
                                    .detailArguments.locationModel?.woeid ??
                                widget.detailArguments.favoritesModel!.woeid,
                            favorite: isFavorite,
                            locationName: widget.state.detailModel?.title ??
                                widget.detailArguments.favoritesModel!
                                    .locationName,
                            docID: widget.detailArguments.favoritesModel!.docID,
                          ),
                        );
                  },
                  icon: isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: AppColors.dangerColor,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: AppColors.dangerColor,
                        ),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteDefine.loginSignupIndexScreen.name);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColors.dangerColor,
                  ),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: InformationWidget(
          isMetric: !sharedPrefs.metric!,
          cityName: widget.state.detailModel!.title,
          countryName: widget.state.detailModel!.parent.title,
          humidity: widget.state.detailModel!.consolidated_weather.first.humidity,
          pressure:
              widget.state.detailModel!.consolidated_weather.first.airPressure,
          temperature:
              widget.state.detailModel!.consolidated_weather.first.theTemp,
          weatherState: widget
              .state.detailModel!.consolidated_weather.first.weatherStateName,
          windSpeed:
              widget.state.detailModel!.consolidated_weather.first.windSpeed,
          widget: FLChart(
            list: widget.state.detailModel!.consolidated_weather,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/model/location/location_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/route/app_routing.dart';
import '../../bloc/search_bloc.dart';

Padding searchResultWidget(BuildContext context, SearchResultState state) =>
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(
                state.locationModel.elementAt(index).title.toString(),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteDefine.detailScreen.name,
                  arguments: LocationModel(
                    location_type:
                    state.locationModel.elementAt(index).location_type,
                    woeid: state.locationModel.elementAt(index).woeid,
                    latt_long: state.locationModel.elementAt(index).latt_long,
                  ),
                );
              },
            ),
          ),
          itemCount: state.locationModel.length,
        ),
      ),
    );

Padding searchLoadedWidget(BuildContext context) => Padding(
  padding: const EdgeInsets.all(16.0),
  child: SvgPicture.asset(
    Assets.svgImages.search.path,
  ),
);
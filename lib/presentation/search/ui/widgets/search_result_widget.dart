import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/favorites/favorites_model.dart';
import '../../../../data/model/location/location_model.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../detail/ui/detail_screen.dart';
import '../../bloc/search_bloc.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({
    Key? key,
    required this.state,
    required this.context,
  }) : super(key: key);
  final BuildContext context;
  final SearchResultState state;

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
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
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(
                title: Text(
                  widget.state.locationModel!.elementAt(index).title.toString(),
                ),
                onTap: () async {
                  if (user != null) {
                    context.read<SearchBloc>().add(
                          SearchAddEvent(
                            woeid: widget.state.locationModel!
                                .elementAt(index)
                                .woeid,
                            favorite: false,
                            locationName: widget.state.locationModel!
                                .elementAt(index)
                                .title
                                .toString(),
                            docID:
                                '${widget.state.locationModel!.elementAt(index).title} - ${FirebaseAuth.instance.currentUser!.uid}',
                          ),
                        );

                    await loginNavigator(
                      context,
                      index,
                    );
                  } else {
                    await notLoginNavigator(context, index);
                  }
                }),
          ),
          itemCount: widget.state.locationModel!.length,
        ),
      ),
    );
  }

  Future notLoginNavigator(BuildContext context, int index) async {
    return Navigator.pushNamed(
      context,
      RouteDefine.detailScreen.name,
      arguments: DetailArguments(
        locationModel: LocationModel(
          locationType:
              widget.state.locationModel!.elementAt(index).locationType,
          woeid: widget.state.locationModel!.elementAt(index).woeid,
          lattLong: widget.state.locationModel!.elementAt(index).lattLong,
          title: widget.state.locationModel!.elementAt(index).title,
        ),
      ),
    );
  }

  Future loginNavigator(
    BuildContext context,
    int index,
  ) async {
    return Navigator.pushNamed(
      context,
      RouteDefine.detailScreen.name,
      arguments: DetailArguments(
        docID: widget.state.favoritesModel!.elementAt(index).docID,
        favoritesModel: FavoritesModel(
          favorite: widget.state.favoritesModel!.elementAt(index).favorite,
          docID: widget.state.favoritesModel!.elementAt(index).docID,
        ),
        locationModel: LocationModel(
          locationType:
              widget.state.locationModel!.elementAt(index).locationType,
          woeid: widget.state.locationModel!.elementAt(index).woeid,
          lattLong: widget.state.locationModel!.elementAt(index).lattLong,
          title: widget.state.locationModel!.elementAt(index).title,
        ),
      ),
    );
  }
}

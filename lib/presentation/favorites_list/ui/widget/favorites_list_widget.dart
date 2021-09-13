import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/favorites/favorites_model.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../detail/ui/detail_screen.dart';
import '../../bloc/favorites_list_bloc.dart';

class FavoritesListWidget extends StatelessWidget {
  const FavoritesListWidget({
    Key? key,
    required this.favoritesListLoadedState,
  }) : super(key: key);
  final FavoritesListLoadedState favoritesListLoadedState;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (favoritesListLoadedState.favoritesModel
                .elementAt(index)
                .favorite! ==
            true) {
          return ListTile(
            title: Text(favoritesListLoadedState.favoritesModel
                .elementAt(index)
                .locationName!),
            trailing: IconButton(
              onPressed: () async {
                context.read<FavoritesListBloc>().add(
                      FavoritesListDeleteEvent(
                        docID: favoritesListLoadedState.favoritesModel
                            .elementAt(index)
                            .docID,
                      ),
                    );
              },
              icon: const Icon(Icons.delete),
            ),
            onTap: () async {
              await Navigator.pushNamed(
                context,
                RouteDefine.detailScreen.name,
                arguments: DetailArguments(
                  favoritesModel: FavoritesModel(
                    favorite: favoritesListLoadedState.favoritesModel
                        .elementAt(index)
                        .favorite,
                    woeid: favoritesListLoadedState.favoritesModel
                        .elementAt(index)
                        .woeid,
                    uid: favoritesListLoadedState.favoritesModel
                        .elementAt(index)
                        .uid,
                    locationName: favoritesListLoadedState.favoritesModel
                        .elementAt(index)
                        .locationName,
                    docID: favoritesListLoadedState.favoritesModel
                        .elementAt(index)
                        .docID,
                  ),
                  docID: favoritesListLoadedState.favoritesModel
                      .elementAt(index)
                      .docID,
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
      itemCount: favoritesListLoadedState.favoritesModel.length,
    );
  }
}

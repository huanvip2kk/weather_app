part of 'detail_bloc.dart';

abstract class DetailState{}

class DetailInitState extends DetailState{}
class DetailFavoriteButtonPressedState extends DetailState{}
class DetailLoadedState extends DetailState{
  final DetailModel? detailModel;

  DetailLoadedState({this.detailModel,});
}
class DetailLoadingState extends DetailState{}
class DetailFailureState extends DetailState{
  String message;
  DetailFailureState({required this.message});
}
part of 'api_bloc.dart';

abstract class AlbumsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<Album> albums;
  AlbumsLoaded({required this.albums});
}

class AlbumsListError extends AlbumsState {
  final error;
  AlbumsListError({this.error});
}

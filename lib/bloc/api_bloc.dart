import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../api/exceptions.dart';
import '../api/services.dart';
import '../model/albums_list.dart';

part 'api_event.dart';
part 'api_state.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumsRepo albumsRepo;
  late List<Album> albums;

  AlbumsBloc({required this.albumsRepo}) : super(AlbumsInitState());

  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
          } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}

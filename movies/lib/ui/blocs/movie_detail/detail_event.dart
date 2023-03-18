part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailEventStarted extends DetailEvent {
  final MovieModel movie;
  const DetailEventStarted(this.movie);

  @override
  List<Object> get props => [movie];
}
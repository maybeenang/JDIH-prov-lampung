part of 'produkhukum_bloc.dart';

abstract class ProdukhukumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProdukhukumFetched extends ProdukhukumEvent {}

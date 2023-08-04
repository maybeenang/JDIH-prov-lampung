part of 'produkhukum_bloc.dart';

abstract class ProdukhukumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProdukhukumFetched extends ProdukhukumEvent {}

final class ProdukhukumRefresh extends ProdukhukumEvent {
  ProdukhukumRefresh({required this.refreshController});

  final BuildContext refreshController;

  @override
  List<Object> get props => [refreshController];
}

final class ProdukHukumFilter extends ProdukhukumEvent {
  ProdukHukumFilter(
      {required this.judul, required this.tahun, required this.nomor});

  final String judul;
  final String tahun;
  final String nomor;

  @override
  List<Object> get props => [judul, tahun, nomor];
}

part of 'produkhukum_bloc.dart';

enum ProdukhukumStatus { initial, success, failure }

final class ProdukhukumState extends Equatable {
  const ProdukhukumState({
    this.status = ProdukhukumStatus.initial,
    this.produkHukum = const <ProdukHukum>[],
    this.hasReachedMax = false,
  });

  final ProdukhukumStatus status;
  final List<ProdukHukum> produkHukum;
  final bool hasReachedMax;

  ProdukhukumState copyWith({
    ProdukhukumStatus? status,
    List<ProdukHukum>? produkHukum,
    bool? hasReachedMax,
  }) {
    return ProdukhukumState(
      status: status ?? this.status,
      produkHukum: produkHukum ?? this.produkHukum,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ProdukhukumState { status: $status, hasReachedMax: $hasReachedMax, produkHukum: ${produkHukum.length} }''';
  }

  @override
  List<Object> get props => [
        status,
        produkHukum,
        hasReachedMax,
      ];
}

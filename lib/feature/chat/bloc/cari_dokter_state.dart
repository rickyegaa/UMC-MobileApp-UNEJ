part of 'cari_dokter_bloc.dart';

@immutable
sealed class CariDokterState {}

final class CariDokterInitial extends CariDokterState {
  final List<DokterModel> models;

  CariDokterInitial({required this.models});
}

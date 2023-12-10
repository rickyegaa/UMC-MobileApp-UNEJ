import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:umc_mobile/model/dokter_model.dart';

import '../../../constant/color.dart';
import '../../../constant/image_assets.dart';

part 'cari_dokter_event.dart';
part 'cari_dokter_state.dart';

class CariDokterBloc extends Bloc<CariDokterEvent, CariDokterState> {
  final cariDokterC = TextEditingController();
  CariDokterBloc()
      : super(
          CariDokterInitial(
            models: [
              DokterModel(
                image: AppImages.dokter1,
                name: "Richard Lee",
                role: "Dokter spesialis kulit",
                color: AppColors.biru1,
              ),
              DokterModel(
                image: AppImages.dokter2,
                name: "Farah",
                role: "Dokter umum",
                color: AppColors.biru1,
              ),
              DokterModel(
                image: AppImages.dokter3,
                name: "Olivia",
                role: "Dokter THT",
                color: AppColors.biru1,
              ),
            ],
          ),
        ) {
    on<OnCariDokter>(onCariDokter);
  }

  void onCariDokter(OnCariDokter event, Emitter<CariDokterState> emit) {
    debugPrint('state 1');
    var state = CariDokterInitial(
      models: [
        DokterModel(
          image: AppImages.dokter1,
          name: "Richard Lee",
          role: "Dokter spesialis kulit",
          color: AppColors.biru1,
        ),
        DokterModel(
          image: AppImages.dokter2,
          name: "Farah",
          role: "Dokter umum",
          color: AppColors.biru1,
        ),
        DokterModel(
          image: AppImages.dokter3,
          name: "Olivia",
          role: "Dokter THT",
          color: AppColors.biru1,
        ),
      ],
    );

    List<DokterModel> filteredList = state.models
        .where((dokter) => dokter.name.toLowerCase().contains(cariDokterC.text))
        .toList();
    emit(CariDokterInitial(models: filteredList));
  }
}

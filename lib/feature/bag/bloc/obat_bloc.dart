import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:umc_mobile/constant/image_assets.dart';

import '../../../model/obat_model.dart';

part 'obat_event.dart';
part 'obat_state.dart';

class ObatBloc extends Bloc<ObatEvent, ObatState> {
  final cariObatC = TextEditingController();

  ObatBloc()
      : super(
          ObatInitial(
            models: [
              ObatModel(
                name: 'Paracetamol\n500mg',
                image: AppImages.obat1,
              ),
              ObatModel(
                name: 'suprabiotic tetracycline hcl\n500mg',
                image: AppImages.obat2,
              ),
              ObatModel(
                name: 'allergen chlorpheniramine maleate\n4mg',
                image: AppImages.obat3,
              ),
              ObatModel(
                name: 'cefixime trihydrate\n100mg',
                image: AppImages.obat4,
              ),
              ObatModel(
                name: 'erbifin metronidazole kaplet\n500mg',
                image: AppImages.obat5,
              ),
              ObatModel(
                name: 'floxigra ciprofloxasin hcl\n500mg',
                image: AppImages.obat6,
              ),
            ],
          ),
        ) {
    on<OnCariObat>(onCariObat);
  }

  void onCariObat(OnCariObat event, Emitter<ObatState> emit) {
    var state = ObatInitial(
      models: [
        ObatModel(
          name: 'Paracetamol\n500mg',
          image: AppImages.obat1,
        ),
        ObatModel(
          name: 'suprabiotic tetracycline hcl\n500mg',
          image: AppImages.obat2,
        ),
        ObatModel(
          name: 'allergen chlorpheniramine maleate\n4mg',
          image: AppImages.obat3,
        ),
        ObatModel(
          name: 'cefixime trihydrate\n100mg',
          image: AppImages.obat4,
        ),
        ObatModel(
          name: 'erbifin metronidazole kaplet\n500mg',
          image: AppImages.obat5,
        ),
        ObatModel(
          name: 'floxigra ciprofloxasin hcl\n500mg',
          image: AppImages.obat6,
        ),
      ],
    );

    List<ObatModel> filteredList = state.models
        .where((dokter) => dokter.name.toLowerCase().contains(cariObatC.text))
        .toList();
    emit(ObatInitial(models: filteredList));
  }
}

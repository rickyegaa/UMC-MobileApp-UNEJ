import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import '../../components/custom_textfield.dart';
import '../../constant/color.dart';
import '../../constant/textstyle.dart';
import 'bloc/obat_bloc.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ObatBloc>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(defaultPadding),
          children: [
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Produk'.toUpperCase(),
                style: AppTextStyle.textStyle20w700
                    .copyWith(color: AppColors.abu4),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFieldWithSearch(
              onChanged: (value) {
                bloc.add(OnCariObat());
              },
              controller: bloc.cariObatC,
              width: 2,
              hintText: '"obat"',
            ),
            SizedBox(
              height: 12,
            ),
            BlocBuilder<ObatBloc, ObatState>(
              builder: (context, state) {
                if (state is ObatInitial) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.92,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.models.length,
                    itemBuilder: (context, index) {
                      final data = state.models[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Image.asset(
                                  data.image,
                                  height: 90,
                                  width: 120,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  width: double.maxFinite,
                                  color: AppColors.biruNavbar,
                                  child: Center(
                                    child: Text(
                                      data.name,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.textStyle12W400
                                          .copyWith(color: AppColors.putih),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

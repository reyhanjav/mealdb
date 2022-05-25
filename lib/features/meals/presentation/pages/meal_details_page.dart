import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb/core/constant/sizes.dart';
import 'package:mealdb/core/constant/text_styles.dart';
import 'package:mealdb/core/injection/injection.dart';
import 'package:mealdb/features/meals/application/meal_details_bloc/meal_details_bloc.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  late BuildContext _buildContext;
  Future<void> onRefresh() async {
    BlocProvider.of<MealDetailsBloc>(_buildContext)
        .add(MealDetailsEvent.details(widget.id ?? '52772'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt<MealDetailsBloc>()
          ..add(MealDetailsEvent.details(widget.id ?? '52772')),
        child: Scaffold(
          appBar: AppBar(),
          body: Builder(builder: (context) {
            _buildContext = context;
            return BlocBuilder<MealDetailsBloc, MealDetailsState>(
              builder: (context, state) {
                return state.map(loadInProgress: (value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loadSuccess: (value) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            value.result?.thumbnail ?? '',
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: Sizes.v2h3Edge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  value.result?.tags ?? '',
                                  style: TextStyles.greyHeadline6,
                                ),
                                Text(
                                  value.result?.title ?? '',
                                  style: TextStyles.headline3,
                                ),
                                Sizes.verticalSpaceMedium,
                                const Text(
                                  'Ingredients',
                                  style: TextStyles.headline4,
                                ),
                                Sizes.verticalSpaceSmall,
                                ListView.separated(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      value.result?.ingredients.length ?? 0,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Sizes.verticalSpaceIcon;
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return value.result?.ingredients[index]
                                                ?.ingredient !=
                                            null
                                        ? Row(
                                            children: [
                                              Text(
                                                '- ${value.result?.ingredients[index]?.ingredient ?? ''}',
                                                style: TextStyles
                                                    .primaryTextStyle3,
                                              ),
                                              Sizes.horizontalSpaceMedium,
                                              Text(
                                                value.result?.ingredients[index]
                                                        ?.measure ??
                                                    '',
                                                style:
                                                    TextStyles.greyTextStyle3,
                                              ),
                                            ],
                                          )
                                        : Container();
                                  },
                                ),
                                Sizes.verticalSpaceMedium,
                                const Text(
                                  'Instructions',
                                  style: TextStyles.headline5,
                                ),
                                Sizes.verticalSpaceSmall,
                                Text(
                                  value.result?.instructions ?? '',
                                  textAlign: TextAlign.justify,
                                  style: TextStyles.primaryTextStyle3,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, loadFailure: (_) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          size: 24,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Failed to Fetch Meal Details'),
                        CupertinoButton(
                            child: const Text('Refresh'),
                            onPressed: () => onRefresh())
                      ],
                    ),
                  );
                });
              },
            );
          }),
        ));
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdb/core/constant/sizes.dart';
import 'package:mealdb/core/injection/injection.dart';
import 'package:mealdb/features/meals/application/category_bloc/category_bloc.dart';
import 'package:mealdb/features/meals/application/list_meals_bloc/list_meals_bloc.dart';
import 'package:mealdb/widgets/pages_shimmer.dart';

import 'meal_details_page.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  String? category;
  late BuildContext _buildContext;

  Future<void> onRefresh() async {
    BlocProvider.of<ListMealsBloc>(_buildContext)
        .add(ListMealsEvent.list(category ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meals DB'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                getIt<CategoryBloc>()..add(const CategoryEvent.list()),
          ),
          BlocProvider(
            create: (BuildContext context) => getIt<ListMealsBloc>(),
          ),
        ],
        child: Builder(builder: (context) {
          _buildContext = context;
          return BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {
              state.when(
                  loadInProgress: () => Container(),
                  loadSuccess: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        category = value.first.category ?? '';
                      });
                    }
                  },
                  loadFailure: () => Container());
            },
            builder: (context, state) {
              return state.map(
                  loadInProgress: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  loadSuccess: (result) {
                    BlocProvider.of<ListMealsBloc>(_buildContext)
                        .add(ListMealsEvent.list(category ?? ''));
                    return result.result.isNotEmpty
                        ? Padding(
                            padding: Sizes.v2h3Edge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                DropdownButton<String>(
                                  alignment: Alignment.centerLeft,
                                  hint: const Text('Select Category'),
                                  value: category ?? result.result[0].category,
                                  items: result.result.map((value) {
                                    return DropdownMenuItem(
                                      child: Text(value.category ?? ''),
                                      value: value.category,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      category = value;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: BlocBuilder<ListMealsBloc,
                                          ListMealsState>(
                                      builder: (BuildContext context,
                                          ListMealsState state) {
                                    return state.map(
                                        loadInProgress: (_) => GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 16,
                                                    mainAxisSpacing: 16,
                                                    childAspectRatio: 2 / 3),
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return const PagesShimmer();
                                            }),
                                        loadSuccess: (value) {
                                          return RefreshIndicator(
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  padding: Sizes.v2h3Edge,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 16,
                                                          mainAxisSpacing: 16,
                                                          childAspectRatio:
                                                              2 / 2.5),
                                                  itemCount:
                                                      (value.result.length),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        OpenContainer(
                                                          openElevation: 0,
                                                          openColor: Colors
                                                              .transparent,
                                                          closedColor: Colors
                                                              .transparent,
                                                          transitionType:
                                                              ContainerTransitionType
                                                                  .fade,
                                                          transitionDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          closedElevation: 0,
                                                          openBuilder: (context,
                                                                  _) =>
                                                              MealDetailsPage(
                                                            id: value
                                                                .result[index]
                                                                .id,
                                                          ),
                                                          closedBuilder:
                                                              (context, _) =>
                                                                  Container(
                                                            height: 150,
                                                            width: 200,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        value.result[index].thumbnail ??
                                                                            ''),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                        ),
                                                        Sizes
                                                            .verticalSpaceSmall,
                                                        Text(
                                                          value.result[index]
                                                                  .title ??
                                                              '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                              onRefresh: () => onRefresh());
                                        },
                                        loadFailure: (_) => Container());
                                  }),
                                ),
                              ],
                            ),
                          )
                        : const Center(
                            child: Text('Category Empty'),
                          );
                  },
                  loadFailure: (error) {
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
                          const Text('Failed to Get Category'),
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
      ),
    );
  }
}

import 'package:api_cubit/src/cubit/category/category_cubit.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:api_cubit/src/pages/add_new_category.dart';
import 'package:api_cubit/src/pages/edit_category_page.dart';
import 'package:api_cubit/src/widgets/app_load_error_widget.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// add category and edit category
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryCubit()..getAllCategory(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Categories"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const AddNewCategoryPage()));
            },
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
              child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width, // Width of the screen
              height:
                  MediaQuery.of(context).size.height, // Height of the screen
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const AppLoader();
                  } else if (state is CategoryLoadSuccess) {
                    List<CategoryModel> categories = state.categories;
                    return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (_, index) {
                        CategoryModel categoryModel = categories[index];
                        return ListTile(
                            title: Text(categoryModel.categoryName),
                            subtitle: Text(categoryModel.categoryCode),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => EditCategoryPage(
                                                  categoryModel:
                                                      categoryModel)));
                                    },
                                    icon: const Icon(Icons.edit)),
                                const SizedBox(
                                  width: 12,
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<CategoryCubit>()
                                          .deleteCategory(categoryModel);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ));
                      },
                    );
                  } else if (state is CategoryLoadError) {
                    return AppLoadErrorWidget(
                      errorMessage: state.errorMessage,
                      onReload: () {
                        context.read<CategoryCubit>().getAllCategory();
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const AddNewCategoryPage()));
                },
                child: const Icon(Icons.add),
              ),
            ),
          ])),
        ));
  }
}

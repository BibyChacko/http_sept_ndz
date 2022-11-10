import 'package:api_cubit/src/cubit/category/category_cubit.dart';
import 'package:api_cubit/src/models/category_model.dart';
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
          body: SafeArea(child: BlocBuilder<CategoryCubit, CategoryState>(
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
                                  // TODO : Navigate to an edit page
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
          )),
        ));
  }
}

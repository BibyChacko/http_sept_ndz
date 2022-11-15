import 'package:api_cubit/src/cubit/category/category_cubit.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:api_cubit/src/widgets/app_button.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const EditCategoryPage({required this.categoryModel,Key? key}) : super(key: key);

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
   TextEditingController _categoryCodeController = TextEditingController();
   TextEditingController _categoryNameController = TextEditingController();

  @override
  void initState() {
    _categoryCodeController = TextEditingController(text: widget.categoryModel.categoryCode);
    _categoryNameController = TextEditingController(text: widget.categoryModel.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit category"),
        ),
        body: SafeArea(
            child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _categoryCodeController,
                      decoration: InputDecoration(labelText: "Category Code"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _categoryNameController,
                      decoration: InputDecoration(labelText: "Category Name"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<CategoryCubit, CategoryState>(
                      listener: (context, state) {
                      },
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const AppLoader();
                        }
                        return AppButton(
                          buttonLabel: "Update",
                          onTap: () {
                            String categoryCode = _categoryCodeController.text.trim();
                            String categoryName = _categoryNameController.text.trim();
                            widget.categoryModel.categoryCode = categoryCode;
                            widget.categoryModel.categoryName = categoryName;
                            context.read<CategoryCubit>().updateCategory(widget.categoryModel);
                          },
                        );
                      },
                    )
                  ],
                ))),
      ),
    );
  }
}

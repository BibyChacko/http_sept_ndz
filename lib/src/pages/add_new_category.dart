import 'package:api_cubit/src/cubit/category/category_cubit.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:api_cubit/src/widgets/app_button.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNewCategoryPage extends StatefulWidget {
  const AddNewCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddNewCategoryPage> createState() => _AddNewCategoryPageState();
}

class _AddNewCategoryPageState extends State<AddNewCategoryPage> {
  final TextEditingController _categoryCodeController = TextEditingController();
  final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add new category"),
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
                if (state is CategoryCreationSuccess) {
                  Navigator.pop(context);
                } else if (state is CategoryCreationFailure) {
                  Fluttertoast.showToast(
                      msg: "${state.errorMessage}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const AppLoader();
                }
                return AppButton(
                  buttonLabel: "Submit",
                  onTap: () {
                    String categoryCode = _categoryCodeController.text.trim();
                    String categoryName = _categoryNameController.text.trim();
                    CategoryModel categoryModel = CategoryModel(
                        categoryName: categoryName, categoryCode: categoryCode);
                    context.read<CategoryCubit>().addCategory(categoryModel);
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

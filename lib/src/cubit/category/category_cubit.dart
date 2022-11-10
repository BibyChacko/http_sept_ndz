import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository _repository = CategoryRepository();
  CategoryCubit() : super(CategoryInitial());

  getAllCategory() async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response = await _repository.getAllCategory();
      if (response.status) {
        List<dynamic> categoryJSONList =
            response.data; // List of key value --> List<CategoryModel>
        List<CategoryModel> categories = categoryJSONList
            .map<CategoryModel>(
                (categoryItemJSON) => CategoryModel.fromJSON(categoryItemJSON))
            .toList();
        emit(CategoryLoadSuccess(categories));
      } else {
        String errorMessage = response.error!;
        emit(CategoryLoadError(errorMessage));
      }
    } catch (ex) {
      emit(const CategoryLoadError("Something went wrong"));
    }
  }

  addCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response = await _repository.addCategory(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryCreationSuccess(categoryModel));
      } else {
        emit(CategoryCreationFailure(response.error!));
      }
    } catch (ex) {
      emit(const CategoryCreationFailure("Something went wrong"));
    }
    await Future.delayed(const Duration(seconds: 2));
    getAllCategory();
  }

  getCategoryById(CategoryModel categoryModel) async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response =
          await _repository.getCategoryById(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryByIdLoadSuccess(categoryModel));
      } else {
        emit(CategoryByIdLoadError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryByIdLoadError("Something went wrong"));
    }
  }

  deleteCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response =
          await _repository.deleteCategory(categoryModel);
      if (response.status) {
        emit(CategoryDeleteSuccess());
      } else {
        emit(CategoryDeleteError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryDeleteError("Something went wrong"));
    }
    await Future.delayed(const Duration(seconds: 2));
    getAllCategory();
  }

  updateCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response =
          await _repository.updateCategory(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryUpdateSuccess(categoryModel));
      } else {
        emit(CategoryUpdateError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryUpdateError("Something went wrong"));
    }
    await Future.delayed(const Duration(seconds: 2));
    getAllCategory();
  }
}

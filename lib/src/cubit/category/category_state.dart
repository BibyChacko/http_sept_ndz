part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadSuccess extends CategoryState {
  final List<CategoryModel> categories;

  const CategoryLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryByIdLoadSuccess extends CategoryState {
  final CategoryModel categoryModel;

  const CategoryByIdLoadSuccess(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
}

class CategoryUpdateSuccess extends CategoryState {
  final CategoryModel updateCategoryModel;

  const CategoryUpdateSuccess(this.updateCategoryModel);

  @override
  List<Object> get props => [updateCategoryModel];
}

class CategoryDeleteSuccess extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryCreationSuccess extends CategoryState {
  final CategoryModel categoryModel;

  const CategoryCreationSuccess(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
}

class CategoryCreationFailure extends CategoryState {
  final String errorMessage;

  const CategoryCreationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class CategoryByIdLoadError extends CategoryState {
  final String errorMessage;

  const CategoryByIdLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryUpdateError extends CategoryState {
  final String errorMessage;

  const CategoryUpdateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryDeleteError extends CategoryState {
  final String errorMessage;

  const CategoryDeleteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class CategoryLoadError extends CategoryState {
  final String errorMessage;

  const CategoryLoadError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

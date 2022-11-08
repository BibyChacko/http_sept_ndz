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
  @override
  List<Object> get props => [];
}

class CategoryLoadError extends CategoryState {
  @override
  List<Object> get props => [];
}

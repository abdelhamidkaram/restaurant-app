part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class GetSliderImagesSuccess extends HomeState {
  @override
  List<Object> get props => [];
}
class GetSliderImagesLoading extends HomeState {
  @override
  List<Object> get props => [];
}
class GetSliderImagesError extends HomeState {
  @override
  List<Object> get props => [];
}

class GetPopularProductSuccess extends HomeState {
  @override
  List<Object> get props => [];
}
class GetPopularProductLoading  extends HomeState {
  @override
  List<Object> get props => [];
}
class GetPopularProductError extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllProductSuccess extends HomeState {
  @override
  List<Object> get props => [];
}
class GetAllProductLoading  extends HomeState {
  @override
  List<Object> get props => [];
}
class GetAllProductError extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllCategoriesSuccess extends HomeState {
  @override
  List<Object> get props => [];
}
class GetAllCategoriesLoading  extends HomeState {
  @override
  List<Object> get props => [];
}
class GetAllCategoriesError extends HomeState {
  @override
  List<Object> get props => [];
}

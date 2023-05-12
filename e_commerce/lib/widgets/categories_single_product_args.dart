import 'package:e_commerce/business_logic/categories/bloc/categories_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';

class CategoriesToSingleProductArgs {
  CategoryResponseModel categoryResponseModel;
  CategoriesBloc categoriesBloc;
  CategoriesToSingleProductArgs(
      {required this.categoriesBloc, required this.categoryResponseModel});
}

import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';

class HomeToSingleProductArgs {
  CategoryResponseModel? categoryResponseModel;
  HomeBloc homeBloc;
  HomeToSingleProductArgs(
      {required this.categoryResponseModel, required this.homeBloc});
}

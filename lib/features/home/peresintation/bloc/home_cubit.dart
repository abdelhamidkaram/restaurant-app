import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/models/product.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=> BlocProvider.of(context);
  var index = 0 ;
  List sliderImages = [];
  Future getSliderImages()async{
     if(sliderImages.isEmpty){
       emit(GetSliderImagesLoading());
       DioHelper.getData(endpoint: ApiEndPoints.getSlider).then((value){
         sliderImages = value as List ;
         emit(GetSliderImagesSuccess());
       }).catchError((err){

         sliderImages = [
           'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a',
           'https://img.freepik.com/free-photo/pork-hock-german-with-sauces-dark-background_1150-45508.jpg?w=1060&t=st=1694275846~exp=1694276446~hmac=d22d0bf4126f9478ef338b330fb68b5612be6a0d10bdc9d92465ab45505aadcc',
           'https://img.freepik.com/premium-photo/large-laid-table-different-dishes-whole-family-day-off_127425-26.jpg?w=1060'
          ];

         debugPrint(err.toString());
        emit(GetSliderImagesError());
       });
     }
  }

  //----------------- popular products -----------
 List<Product> popularProducts = [];

  Future getPopularProducts()async{
     if(sliderImages.isEmpty){
       emit(GetPopularProductLoading());
       DioHelper.getData(endpoint: ApiEndPoints.getPopular).then((value){
         popularProducts= value as List<Product> ;
         emit(GetPopularProductSuccess());
       }).catchError((err){
         popularProducts = [
           const Product( img: 'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a',
               id: '1', title: 'Mulberry Pizza', description: '', price: 20),
           const Product(img: 'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a' ,
               id: '2', title: 'Mulberry Pizza2', description: '', price: 20),
           const Product(img: 'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a' ,
               id: '3', title: 'Mulberry Pizza3', description: '', price: 20),
           const Product( img: 'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a' ,
               id: '4', title: 'Mulberry Pizza4', description: '', price: 20),
          ];

         debugPrint(err.toString());
        emit(GetPopularProductError());
       });
     }
  }


}

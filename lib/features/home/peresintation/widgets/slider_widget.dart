import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/home/peresintation/bloc/home_cubit.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({Key? key}) : super(key: key);

  @override
  State<SlideImage> createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => HomeCubit(),
      builder: (context, state) {
        List slides = HomeCubit.get(context).sliderImages;

        if (state == GetSliderImagesLoading()) {
          return SizedBox(
              height: 200.h,
              child: const Center(child: CircularProgressIndicator.adaptive()));
        } else {
          return slides.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 160,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                HomeCubit.get(context).index = index ;
                              });
                            },
                            autoPlay: true, height: 400.0),

                        items: slides.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                 
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage( image:Image.network(i).image,
                                    fit:BoxFit.cover
                                    ),
                                    color: AppColors.primaryColor),

                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(slides.length , (index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: CircleAvatar(
                              radius:8,
                              backgroundColor:index == HomeCubit.get(context).index ? AppColors.white :AppColors.black ,
                              child: CircleAvatar(
                                backgroundColor: index == HomeCubit.get(context).index ? AppColors.primaryColor : AppColors.white ,
                                radius: 7.8,
                              ),
                            ),
                          )),
                    ),
                  ],
                )
              : const SizedBox();
        }
      },
    );
  }
}

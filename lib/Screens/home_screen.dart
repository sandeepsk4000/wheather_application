import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/bloc/weather_bloc_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {


  Widget getWeatherIcon(int code){
    switch (code) {
      case >=200&& <300:
      return Image.asset('assets/thunderstorm.webp',
      height: 200,);
        
         case >=300&& <400:
      return Image.asset('assets/literain.png',height: 200,);
         case >=500&& <600:
      return Image.asset('assets/rain.png',height: 200,);
        case >=600&& <700:
      return Image.asset('assets/snow.png',height: 200,);
       case >=700&& <800:
      return Image.asset('assets/cloud.png',height: 200,);
      case ==800:
      return Image.asset('assets/sun.png',height: 200,);
        case >=800 && <804:
      return Image.asset('assets/sunwithcloud.png');
        
        
      default:
      return Image.asset('assets/sunwithcloud.png');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  )),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess){

                  
                  return  SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        '📍${state.weather.areaName}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Good Morning',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                       const SizedBox(height: 20,),
                      Center(
                        child: 
                          getWeatherIcon(state.weather.weatherConditionCode!)  ,
                          
                        
                      ),
                      const SizedBox(height: 30,),
                       Center(
                        child: Text(
                          '${state.weather.temperature!.celsius!.round()}\u2103',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 55),
                        ),
                      ),
                      //const SizedBox(height: 10,),
                       //Center(
                      //   child: Text(
                      //     'Temperature feelsLike ${state.weather.tempFeelsLike!.celsius!.round()}\u2103',
                      //     style:const  TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 18),
                      //   ),
                      // ),
                      // const SizedBox(height: 10,),
                      Center(
                        child: Text(
                          ' ${state.weather.weatherMain!.toUpperCase()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Center(
                        child: Text(
                          DateFormat('EEEE - dd - yy').format(state.weather.date!),
                          //'Tuesday 10 - 09.00am',
                          style:const  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/sun.png',
                                height: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const  Text(
                                    'Sunrise',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                 const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunrise!),
                                    
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/night.png',
                                height: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const  Text(
                                    'Sunset',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                 const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunset!),
                                    style:const  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                     const  Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Divider(
                          color: Colors.grey,
                        ),),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/maxtemp.png',
                                height: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    ' Temp Max',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                 const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    ' ${state.weather.tempMax!.celsius!.round()}\u2103',
                                    //'${state.weather.tempMax}' + '\u2103',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/mintemp.png',
                                height: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Temp Min',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(' ${state.weather.tempMin!.celsius!.round()}\u2103'
                                    ,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                }else{
                 return Container();
                }
  })
            ],
          ),
        ),
      ),
    );
  }
}

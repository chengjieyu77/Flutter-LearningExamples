import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedPeopleIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: -MediaQuery.of(context).viewPadding.top,
                  child: Container(
                    height: 350,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${state.place.img}"
                                //"images/welcome-one.webp"
                                ),
                            fit: BoxFit.fitWidth)),
                    //child: Image.asset("images/welcome-one.webp"),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  right: 20,
                  child: Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.arrow_back)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
                    ),
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 300,
                  child: Container(
                    width: double.maxFinite,
                    height: 700,
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: "${detail.place.name}"),
                            AppLargeText(
                              text: "\$ ${detail.place.price}",
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.blueAccent,
                            ),
                            AppText(text: "${detail.place.location}")
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                if (index < gottenStars) {
                                  return Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  );
                                } else {
                                  return Icon(
                                    Icons.star_outline,
                                    size: 20,
                                    color: Colors.black54,
                                  );
                                }
                              }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(text: "(${detail.place.stars}.0)")
                          ],
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                          text: "People",
                          size: 22,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          color: Colors.black26,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPeopleIndex = index;
                                });
                              },
                              child: AppButtons(
                                isIcon: false,
                                text: "${index + 1}",
                                color: selectedPeopleIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedPeopleIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                size: 50,
                                borderColor: selectedPeopleIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                        ),
                        AppText(
                            text:
                                "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.")
                      ],
                    ),
                  )),
              Positioned(
                left: 20,
                bottom: 20,
                right: 20,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: AppButtons(
                          isIcon: true,
                          icon: Icons.favorite_border,
                          color:
                              isFavorite ? Colors.redAccent : Colors.blueAccent,
                          backgroundColor:
                              isFavorite ? Colors.blueAccent : Colors.white,
                          size: 60,
                          borderColor: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ResponsiveButton(
                        isResponsive: true,
                        text: "Book Trip Now",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/home_screen/components/secondary_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecomm_bloc_app/designs/animated_app_with_rive/models/course_model.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/home_screen/components/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Courses",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses.map(
                      (course) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CourseCard(course: course),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              ...recentCourses.map((e) => Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SecondaryCourseCard(
                      course: e,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

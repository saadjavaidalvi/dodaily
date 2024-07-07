import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/home/create_new_task_screen.dart';
import 'package:do_daily/home/task_details_screen.dart';
import 'package:do_daily/models/user_model.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:do_daily/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_kit/responsive_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toggleDateWidget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors().primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Nav.push(const CreateNewTaskScreen(), context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: ConstColors().secondary,
        child: Icon(
          Icons.add,
          color: ConstColors().primary,
        ),
      ),
      body: Padding(
        padding: Cmargin.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: Cmargin.only(top: 70),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleDateWidget = !toggleDateWidget;
                        });
                      },
                      child: Container(
                        height: SizeConfig.getMyDynamicHeight(44),
                        constraints: BoxConstraints(
                          minWidth: SizeConfig.getMyDynamicWidth(147),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: ConstColors().primary,
                          border: Border.all(
                            color: ConstColors().secondary,
                          ),
                        ),
                        child: Padding(
                          padding: Cmargin.symmetric(
                            horizontal: 37,
                          ),
                          child: Center(
                            child: Text(
                              toggleDateWidget ? "X" : "5 Jul 2024",
                              style: CustomTextStyle().bold16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              height: !toggleDateWidget ? 0 : SizeConfig.getMyDynamicHeight(60),
              padding: Cmargin.only(
                top: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  7,
                  (index) => Container(
                    // height: SizeConfig.getMyDynamicWidth(44),
                    width: SizeConfig.getMyDynamicWidth(44),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ConstColors().secondary,
                    ),
                    margin: Cmargin.symmetric(horizontal: 2),
                    child: Padding(
                      padding: Cmargin.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mon',
                            style: CustomTextStyle().body11.copyWith(
                                color: ConstColors().primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '0${index + 1}',
                            style: CustomTextStyle().body14.copyWith(
                                color: ConstColors().primary,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: Cmargin.only(bottom: 48, top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Saad 👋',
                        style: CustomTextStyle().bold20,
                      ),
                      Text(
                        'Today you have 0 tasks',
                        style: CustomTextStyle()
                            .bold20
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl:
                              context.watch<UserModel>().user?.photoURL ?? '',
                          height: SizeConfig.getMyDynamicHeight(45),
                          width: SizeConfig.getMyDynamicHeight(45),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            pendingTaskSection(),
            allTaskSection()
          ],
        ),
      ),
    );
  }

  Widget pendingTaskSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending ⏳',
          style: CustomTextStyle().bold16,
        ),
        Padding(
          padding: Cmargin.only(top: 24, bottom: 48),
          child: Row(
            children: List.generate(
              2,
              (index) => GestureDetector(
                onTap: () {
                  Nav.push(const TaskDetailScreen(), context);
                },
                child: Container(
                  margin: Cmargin.only(right: 16),
                  height: SizeConfig.getMyDynamicHeight(160),
                  width: SizeConfig.getMyDynamicWidth(142),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: ConstColors().primary,
                    border:
                        Border.all(color: ConstColors().secondary, width: 2),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: SizeConfig.getMyDynamicHeight(160),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://www.eta.co.uk/wp-content/uploads/2012/09/Cycling-by-water-resized-min.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: ConstColors().secondary,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.getMyDynamicWidth(142),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: ConstColors().primary.withOpacity(.80),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cycling',
                              style: CustomTextStyle().bold18,
                            ),
                            Text(
                              '28 days 🔥',
                              style: CustomTextStyle()
                                  .body11
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget allTaskSection() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'All Tasks',
              style: CustomTextStyle().bold18,
            ),
          ],
        ),
        Padding(
          padding: Cmargin.only(top: 171),
          child: Text(
            'No Tasks',
            style: CustomTextStyle()
                .bold18
                .copyWith(fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}

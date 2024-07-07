import 'package:do_daily/auth/sigin_screen.dart';
import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:do_daily/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors().primary,
      floatingActionButton: Padding(
        padding: Cmargin.symmetric(horizontal: 24, vertical: 55),
        child: SignInButton(
          image: '',
          text: 'create',
          onTap: () {
            Nav.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: Cmargin.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: Cmargin.only(top: 70, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ConstColors().secondary,
                    ),
                    onPressed: () {
                      Nav.pop(context);
                    },
                  ),
                  Text(
                    'Create New Task',
                    style: CustomTextStyle().bold20,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: Cmargin.only(bottom: 16),
                  child: Text(
                    'Cover Picture',
                    style: CustomTextStyle()
                        .body14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: Cmargin.only(bottom: 36),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ConstColors().secondary.withOpacity(.10),
                          ),
                          height: SizeConfig.getMyDynamicHeight(155),
                          child: Center(
                            child: Icon(
                              Icons.add_circle_outline,
                              color: ConstColors().secondary,
                              size: SizeConfig.getMyDynamicHeight(46),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: Cmargin.only(bottom: 16),
                  child: Text(
                    'Task Name',
                    style: CustomTextStyle()
                        .body14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: Cmargin.only(bottom: 36),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ConstColors().secondary.withOpacity(.10),
                    ),
                    height: SizeConfig.getMyDynamicHeight(60),
                    child: Center(
                      child: Padding(
                        padding: Cmargin.symmetric(horizontal: 16),
                        child: TextField(
                          cursorColor: ConstColors().secondary,
                          style: CustomTextStyle()
                              .bold16
                              .copyWith(fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Task Name',
                              hintStyle: CustomTextStyle().bold16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color:
                                      ConstColors().secondary.withOpacity(.5))),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

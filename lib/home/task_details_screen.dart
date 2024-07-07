import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_daily/auth/sigin_screen.dart';
import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:do_daily/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors().primary,
      floatingActionButton: Padding(
        padding: Cmargin.symmetric(vertical: 49, horizontal: 24),
        child: SignInButton(
            text: 'MARK AS DONE',
            onTap: () {
              Nav.pop(context);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: Cmargin.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: Cmargin.only(top: 51, bottom: 48),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Nav.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: ConstColors().secondary,
                      size: SizeConfig.getMyDynamicHeight(24),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Cmargin.only(bottom: 54),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth -
                            SizeConfig.getMyDynamicWidth(50),
                        height: SizeConfig.getMyDynamicHeight(228),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://www.eta.co.uk/wp-content/uploads/2012/09/Cycling-by-water-resized-min.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              color: ConstColors().secondary,
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: ConstColors().secondary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth -
                            SizeConfig.getMyDynamicWidth(50),
                        height: SizeConfig.getMyDynamicHeight(228),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ConstColors().primary.withOpacity(.70),
                          ),
                        ),
                      ),
                      Text(
                        'Cycling',
                        style: CustomTextStyle().bold40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: Cmargin.only(bottom: 24),
              child: Text(
                'You have been doing this for  4 days',
                style: CustomTextStyle().bold16,
              ),
            ),
            Text(
              'Make it your 5th consecitive day by marking it\ndone from that bottom button 💪',
              style: CustomTextStyle()
                  .bold16
                  .copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

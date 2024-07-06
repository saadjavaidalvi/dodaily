import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/home/create_new_task_screen.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:do_daily/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                  padding: Cmargin.only(top: 70, bottom: 32),
                  child: FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: ConstColors().primary,
                        border: Border.all(
                          color: ConstColors().secondary,
                        ),
                      ),
                      child: Padding(
                        padding:
                            Cmargin.symmetric(horizontal: 37, vertical: 15),
                        child: Center(
                          child: Text(
                            "5 Jul 2024",
                            style: CustomTextStyle().bold16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: Cmargin.only(bottom: 48),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Saad 👋',
                        style: CustomTextStyle().bold20,
                      ),
                      Text(
                        'Today you have No tasks',
                        style: CustomTextStyle()
                            .bold20
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'All tasks',
                  style: CustomTextStyle().bold18,
                ),
              ],
            ),
            Padding(
              padding: Cmargin.only(top: 171),
              child: const Text('No Tasks'),
            )

            /* CachedNetworkImage(
              imageUrl: context.watch<UserModel>().user?.photoURL ?? '',
              height: 100,
              width: 100,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ), */
          ],
        ),
      ),
    );
  }
}

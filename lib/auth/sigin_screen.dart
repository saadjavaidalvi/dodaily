import 'package:do_daily/config/asset_strings.dart';
import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/home/home_screen.dart';
import 'package:do_daily/models/user_model.dart';
import 'package:do_daily/services/firebase_auth_services.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:do_daily/widgets/custom_navigator.dart';
import 'package:do_daily/widgets/my_flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_kit/responsive_kit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors().primary,
      body: ModalProgressHUD(
        // This is the progress loading indicator
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // App logo
              Padding(
                padding: const EdgeInsets.only(top: 175.0),
                child: SvgPicture.asset(
                  AssetStrings().logoBlack,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              // Sign in Buttons
              Padding(
                padding: Cmargin.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Google Sign in
                    Padding(
                      padding: Cmargin.only(bottom: 16),
                      child: SignInButton(
                        image: AssetStrings().googleIcon,
                        text: 'Sign In with Google',
                        onTap: () async {
                          try {
                            GoogleSignIn googleSignIn = GoogleSignIn();

                            // Sign in with Google
                            final GoogleSignInAccount? googleUser =
                                await googleSignIn.signIn();
                            if (googleUser == null) {
                              return null; // User canceled the sign-in
                            }

                            setState(() {
                              isLoading = true;
                            });

                            final GoogleSignInAuthentication googleAuth =
                                await googleUser.authentication;

                            // Get credentials for the firebase auth
                            final AuthCredential credential =
                                GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken,
                            );

                            // Sign in with Google in firebase account
                            final UserCredential userCredential =
                                await FirebaseAuthService.auth
                                    .signInWithCredential(credential);

                            setState(() {
                              isLoading = false;
                            });

                            // If the context is mounted
                            if (context.mounted) {
                              // update the state
                              context
                                  .read<UserModel>()
                                  .updateUser(userCredential.user!);

                              // Navigate to the home screen
                              Nav.pushAndRemoveUntil(
                                  const HomeScreen(), context);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              MyToast().animatedToast(
                                context,
                                header: 'Sorry for inconvenience',
                                content:
                                    'There seems to be a problem on our side.\nPlease try again and if the problem persists please reach out.',
                                removQueueToasts: true,
                              );
                            }
                            if (kDebugMode) {
                              // Only in debug mode
                              print(e);
                            }
                          }
                        },
                      ),
                    ),
                    // Apple Sign in
                    Padding(
                      padding: Cmargin.only(bottom: 65),
                      child: SignInButton(
                        image: AssetStrings().appleIcon,
                        text: 'Sign In with Apple',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// The sign in button that is used in the start screen
/// It is rounded with a text and icon in between
class SignInButton extends StatelessWidget {
  const SignInButton(
      {super.key, this.image = '', required this.text, required this.onTap});
  final String image;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.getMyDynamicHeight(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: ConstColors().secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image.isEmpty
                ? Container()
                : Padding(
                    padding: Cmargin.only(right: 9),
                    child: SvgPicture.asset(
                      image,
                      colorFilter: ColorFilter.mode(
                          ConstColors().primary, BlendMode.srcIn),
                      height: SizeConfig.getMyDynamicHeight(24),
                    ),
                  ),
            SizedBox(
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: CustomTextStyle().bold18.copyWith(
                        color: ConstColors().primary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

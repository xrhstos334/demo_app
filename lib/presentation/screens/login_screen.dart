import 'package:demo_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/fonts.dart';
import '../../core/constants/style.dart';
import '../../core/utils/keys/asset_keys.dart';
import '../../routes/routes.dart';
import '../blocs/login_bloc.dart' hide LoginStatus;
import '../widgets/common_text_form_field.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: _listener,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                            backgroundColor: Style.lightGrayColor,
                            radius: 20,
                            child: Icon(Icons.arrow_back_ios_new, size: 14)),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Text(
                      'Sign in now',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.sfUI,
                            fontSize: 32,
                          ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Please sign in to continue our app',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: Fonts.sfUI,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.07),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: 'www.uihut@gmail.com',
                      onChanged: (value) => context.read<LoginBloc>().add(
                            LoginEvent.usernameChanged(value),
                          ),
                    ),
                    SizedBox(height: 16),
                    CommonTextFormField(
                      onChanged: (value) => context.read<LoginBloc>().add(
                            LoginEvent.passwordChanged(value),
                          ),
                      obscureText: state.togglePasswordVisibility,
                      controller: passwordController,
                      hintText: '************',
                      suffixIcon: IconButton(
                          onPressed: () => context.read<LoginBloc>().add(
                              LoginEvent.togglePasswordVisibility(
                                  !state.togglePasswordVisibility)),
                          icon: Icon(
                              color: Style.lightSubTextColor,
                              state.togglePasswordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: Fonts.sfUI,
                            fontSize: 14,
                            color: Style.secondaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        child: Text(
                          'Sign In',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    fontSize: 16,
                                    color: Style.lightSubTextColor,
                                  ),
                        ),
                        Text(
                          "Sign up",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Style.secondaryColor,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.025),
                    Text(
                      "Or connect",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: Fonts.sfUI,
                            fontSize: 16,
                            color: Style.lightSubTextColor,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.09),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(AssetKeys.facebook, () async {
                          context
                              .read<LoginBloc>()
                              .add(LoginEvent.connectWithFacebook());
                        }),
                        SizedBox(width: 20),
                        _buildSocialIcon(AssetKeys.instagram, () {}),
                        SizedBox(width: 20),
                        _buildSocialIcon(AssetKeys.twitter, () {}),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if (state.loginStatus == LoginStatusView.loginSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboardScreen, (route) => false);
    }
  }

  Widget _buildSocialIcon(String asset, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        asset,
        width: 50,
        height: 50,
      ),
    );
  }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      loginBehavior: LoginBehavior.webOnly,
    );
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}

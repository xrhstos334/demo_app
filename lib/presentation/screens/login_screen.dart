import 'package:demo_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/fonts.dart';
import '../../core/constants/style.dart';
import '../../core/utils/keys/asset_keys.dart';
import '../blocs/login_bloc.dart';
import '../widgets/common_text_form_field.dart';

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
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
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
                            fontWeight: FontWeight.w500
                          ),
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
                          padding:  EdgeInsets.symmetric(
                              horizontal: 100, vertical: 16),
                          child: Text('Sign In',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                          Text("Don’t have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: Fonts.sfUI,
                              fontSize: 16,
                              color: Style.lightSubTextColor,
                            ),
                          ),
                          Text(
                            "Sign up",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: Fonts.sfUI,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Style.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.025),
                      Text("Or connect",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: Fonts.sfUI,
                          fontSize: 16,
                          color: Style.lightSubTextColor,
                        ),
                      ),
                      Spacer(),
                      _social(),
                      SizedBox(height: SizeConfig.screenHeight * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _social() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildSocialIcon('facebook'),
      SizedBox(width: 20),
      _buildSocialIcon('instagram'),
      SizedBox(width: 20),
      _buildSocialIcon('twitter'),
    ],
  );

  Widget _buildSocialIcon(String platform) {
    String icon;
    switch (platform) {
      case 'facebook':
        icon = AssetKeys.facebook;
        break;
      case 'instagram':
        icon = AssetKeys.instagram;
        break;
      case 'twitter':
        icon = AssetKeys.twitter;
        break;
      default:
        icon = AssetKeys.facebook;
    }

    return SvgPicture.asset(
      icon,
      width: 50,
      height: 50,
    );
  }
}

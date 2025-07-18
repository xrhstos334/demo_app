import 'package:demo_app/core/utils/size_config.dart';
import 'package:demo_app/core/utils/validators.dart';
import 'package:demo_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/fonts.dart';
import '../../core/constants/style.dart';
import '../../core/utils/keys/asset_keys.dart';
import '../../routes/routes.dart';
import '../providers/auth_status_enums.dart';
import '../widgets/common_text_form_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final _formKeyEmail = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

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
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: _listener,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05),
                child: _viewHandler(state, context),
              ),
            ),
          );
        },
      ),
    );
  }

   Widget _viewHandler(AuthState state, BuildContext context) {
    if (state.view == AuthView.login) {
      return _loginWidget(state, context);
    } else if (state.view == AuthView.signUp) {
      return _signUpWidget(state, context);
    } else if (state.view == AuthView.forgotPassword) {
      return _forgotPassword(state, context);
    }else{
      return SizedBox();
    }

  }




  Widget _forgotPassword(AuthState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _backButton(context),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: Fonts.sfUI,
            fontSize: 32,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: Text(
            textAlign: TextAlign.center,
            'Enter your email account to reset  your password',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: Fonts.sfUI,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.07),
        CommonTextFormField(
          formKey: _formKeyEmail,
          validator: (value) => Validators.emailValidator(value),
          controller: emailController,
          hintText: 'www.uihut@gmail.com',
          onChanged: (value) => context.read<AuthBloc>().add(
            AuthEvent.emailChanged(value),
          ),
        ),

        SizedBox(height: SizeConfig.screenHeight * 0.05),
        ElevatedButton(
          onPressed: () {
            if (_formKeyEmail.currentState!.validate()) {
               context.read<AuthBloc>().add(AuthEvent.resetPassword(state.email));
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:
                SizeConfig.screenHeight * 0.1,
                vertical: 16),
            child: Text(
              'Reset Password',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: Fonts.sfUI,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );

  }

  Widget _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => context.read<AuthBloc>().backButtonNavigationAuth(),
        child: CircleAvatar(
          backgroundColor: Style.lightGrayColor,
          radius: 20,
          child: Icon(Icons.arrow_back_ios_new, size: 14),
        ),
      ),
    );
  }


  Widget _loginWidget(AuthState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _backButton(context),
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
          formKey: _formKeyEmail,
          validator: (value) => Validators.emailValidator(value),
          controller: emailController,
          hintText: 'www.uihut@gmail.com',
          onChanged: (value) => context.read<AuthBloc>().add(
                AuthEvent.emailChanged(value),
              ),
        ),
        SizedBox(height: 16),
        CommonTextFormField(
          formKey: _formKey,
          validator: (value) => Validators.passwordValidator(value),
          onChanged: (value) => context.read<AuthBloc>().add(
                AuthEvent.passwordChanged(value),
              ),
          obscureText: state.togglePasswordVisibility,
          controller: passwordController,
          hintText: '************',
          suffixIcon: IconButton(
              onPressed: () => context.read<AuthBloc>().add(
                  AuthEvent.togglePasswordVisibility(
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
          child: TextButton(
            onPressed: () => context.read<AuthBloc>().add(AuthEvent.goTo(AuthView.forgotPassword)),
            child: Text(
              'Forget Password?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: Fonts.sfUI,
                  fontSize: 14,
                  color: Style.secondaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate() && _formKeyEmail.currentState!.validate()) {
              context.read<AuthBloc>().add(AuthEvent.signIn());
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: Fonts.sfUI,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: Fonts.sfUI,
                    fontSize: 16,
                    color: Style.lightSubTextColor,
                  ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEvent.goTo(AuthView.signUp));
              },
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: Fonts.sfUI,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Style.secondaryColor,
                    ),
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
              context.read<AuthBloc>().add(AuthEvent.connectWithFacebook());
            }),
            SizedBox(width: 20),
            _buildSocialIcon(AssetKeys.instagram, () {}),
            SizedBox(width: 20),
            _buildSocialIcon(AssetKeys.twitter, () {}),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.05),
      ],
    );
  }

  Widget _signUpWidget(AuthState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _backButton(context),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          'Sign up now',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: Fonts.sfUI,
                fontSize: 32,
              ),
        ),
        SizedBox(height: 8),
        Text(
          'Please fill the details and create account',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: Fonts.sfUI,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.07),
        CommonTextFormField(
          formKey: null,
          controller: usernameController,
          hintText: 'Username',
          onChanged: (value) => context.read<AuthBloc>().add(
            AuthEvent.usernameChanged(value),
          ),
        ),
        SizedBox(height: 16),

        CommonTextFormField(
            formKey: _formKeyEmail,
            validator: (value) =>  Validators.emailValidator(value),
            controller: emailController,
            hintText: 'www.uihut@gmail.com',
            onChanged: (value) => context.read<AuthBloc>().add(
                  AuthEvent.emailChanged(value),
                ),
          ),
        SizedBox(height: 16),
         CommonTextFormField(
           formKey: _formKey,
            validator: (value) => Validators.passwordValidator(value),
            onChanged: (value) => context.read<AuthBloc>().add(
                  AuthEvent.passwordChanged(value),
                ),
            obscureText: state.togglePasswordVisibility,
            controller: passwordController,
            hintText: '************',
            suffixIcon: IconButton(
                onPressed: () => context.read<AuthBloc>().add(
                    AuthEvent.togglePasswordVisibility(
                        !state.togglePasswordVisibility)),
                icon: Icon(
                    color: Style.lightSubTextColor,
                    state.togglePasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
          ),

        SizedBox(height: SizeConfig.screenHeight * 0.01),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password must be 8 character',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: Fonts.sfUI,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate() && _formKeyEmail.currentState!.validate()) {
               context.read<AuthBloc>().add(AuthEvent.createAccount());
            }

          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: Text(
              'Sign Up',
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
            Text(
              "Don’t have an account? ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: Fonts.sfUI,
                    fontSize: 16,
                    color: Style.lightSubTextColor,
                  ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEvent.goTo(AuthView.login));
              },
              child: Text(
                "Sign in",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: Fonts.sfUI,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Style.secondaryColor,
                    ),
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
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(AssetKeys.facebook, () async {
              context.read<AuthBloc>().add(AuthEvent.connectWithFacebook());
            }),
            SizedBox(width: 20),
            _buildSocialIcon(AssetKeys.instagram, () {}),
            SizedBox(width: 20),
            _buildSocialIcon(AssetKeys.twitter, () {}),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.05),
      ],
    );
  }

  void _listener(BuildContext context, AuthState state)async {
    if (state.authStatus == AuthActionStatus.loginSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboardScreen, (route) => false);
    }else if( state.authStatus == AuthActionStatus.message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage, style: TextStyle(color: Colors.white)),
        ),
      );
    }else if(state.authStatus == AuthActionStatus.resetSuccess){
      _showCheckEmailDialog(context);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);
      context.read<AuthBloc>().add(AuthEvent.goTo(AuthView.login));
    }


    if(state.view == AuthView.back) {
      Navigator.pop(context);
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
}


void _showCheckEmailDialog(BuildContext viewContext) {
  showDialog(
    context: viewContext,
    builder: (BuildContext context) {
      return Dialog( // Using
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Style.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.email,
                color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // "Check your email" text
              const Text(
                'Check your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // "We have send password recovery instruction to your email" text
              Text(
                'We have send password recovery instruction to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


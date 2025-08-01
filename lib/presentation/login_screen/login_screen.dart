import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFF5F5,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 400.h),
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.whiteCustom,
                borderRadius: BorderRadius.circular(16.h),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.blackCustom.withAlpha(26),
                    blurRadius: 12.h,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              padding: EdgeInsets.all(24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLogo(),
                  SizedBox(height: 24.h),
                  _buildWelcomeText(),
                  SizedBox(height: 32.h),
                  _buildLoginForm(context),
                  SizedBox(height: 24.h),
                  _buildDivider(),
                  SizedBox(height: 24.h),
                  _buildGoogleSignInButton(),
                  SizedBox(height: 24.h),
                  _buildSignUpLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return CustomImageView(
      imagePath: ImageConstant.imgChatgptImage28DeJulDe20251256241,
      height: 61.h,
      width: 85.h,
      fit: BoxFit.contain,
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Bem-vindo de volta!',
          style: TextStyleHelper.instance.title22Bold.copyWith(height: 1.23),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Faça login para continuar monitorando sua estufa',
          style: TextStyleHelper.instance.body14.copyWith(height: 1.93),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail',
          style: TextStyleHelper.instance.body13.copyWith(height: 1.31),
        ),
        SizedBox(height: 8.h),
        CustomInputField(
          controller: emailController,
          placeholder: 'seuemail@email.com',
          inputType: TextInputType.emailAddress,
          isRequired: true,
        ),
        SizedBox(height: 24.h),
        Text(
          'Senha',
          style: TextStyleHelper.instance.body14
              .copyWith(color: appTheme.colorFF3333, height: 1.29),
        ),
        SizedBox(height: 8.h),
        CustomInputField(
          controller: passwordController,
          placeholder: '••••••••',
          isPassword: true,
          isRequired: true,
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              _handleForgotPassword();
            },
            child: Text(
              'Esqueci minha senha',
              style: TextStyleHelper.instance.body13
                  .copyWith(color: appTheme.colorFF2F7D, height: 1.23),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomButton(
          text: 'Entrar',
          onPressed: () {
            _handleLogin(context);
          },
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: appTheme.colorFFDDDD,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Text(
            'ou',
            style: TextStyleHelper.instance.body12.copyWith(height: 1.33),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color: appTheme.colorFFDDDD,
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleSignInButton() {
    return Container(
      width: double.infinity,
      height: 39.h,
      child: ElevatedButton(
        onPressed: () {
          _handleGoogleSignIn();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.whiteCustom,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
            side: BorderSide(
              color: appTheme.colorFFCCCC,
              width: 1.h,
            ),
          ),
        ),
        child: Text(
          'Entrar com Google',
          style: TextStyleHelper.instance.body14Medium.copyWith(height: 1.29),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return RichText(
      text: TextSpan(
        style: TextStyleHelper.instance.body13
            .copyWith(color: appTheme.blackCustom, height: 1.31),
        children: [
          TextSpan(text: 'Não tem conta? '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                _handleCreateAccount();
              },
              child: Text(
                'Criar conta',
                style:
                    TextStyleHelper.instance.body13Bold.copyWith(height: 1.31),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      print('Login attempt: email=$email, password=$password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Login functionality would be implemented here')),
      );
    }
  }

  void _handleForgotPassword() {
    print('Forgot password clicked');
  }

  void _handleGoogleSignIn() {
    print('Google sign in clicked');
  }

  void _handleCreateAccount() {
    print('Create account clicked');
  }
}

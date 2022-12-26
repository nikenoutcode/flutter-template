import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/login/login_viewmodel.dart';
import 'package:flutter_template/resource/route_manager.dart';
import 'package:flutter_template/resource/value_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

import '../../app/controller.dart';
import '../../app/di.dart';
import '../../data/model/login/Authentication.dart';
import '../../resource/string_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = instance<LoginViewModel>();
  final controller = Get.put(Controller());

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });

    _viewModel.failureSteamController.stream.listen((data) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data as String),
      ));
    });

      _viewModel.successStreamController.stream.listen((data) {
      // navigate to main screen
      var authenticationData = data as Authentication;
      controller.username = authenticationData.username;
      Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: AppPadding.p100),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: AppSize.s28),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username,
                              labelText: AppStrings.username,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.usernameError),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s28),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordError),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s28),
                  Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: StreamBuilder<bool>(
                        stream: _viewModel.outputIsAllInputsValid,
                        builder: (context, snapshot) {
                          return SizedBox(
                            width: double.infinity,
                            height: AppSize.s40,
                            child: ElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ? () {
                                        _viewModel.login();
                                      }
                                    : null,
                                child: Text(AppStrings.login)),
                          );
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppPadding.p8,
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.forgetPassword,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.registerText,
                              style: Theme.of(context).textTheme.subtitle2),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_bloc.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_event.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_pahe_state.dart';
import 'package:ginFinans/presentation/passwordPage/style/password_page_style.dart';
import 'package:ginFinans/reusableUi/circle_progress.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_textfield.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/reusableUi/text_input_widget_controller.dart';
import 'package:ginFinans/util/i18n.dart';
import 'package:ginFinans/util/palette.dart';
import 'package:ginFinans/util/routes.dart';
import 'package:ginFinans/viewModel/complexityItemModel.dart';
import 'package:ginFinans/viewModel/user_model.dart';

class PasswordPage extends StatelessWidget {
  final UserModel userModel;
  const PasswordPage({Key key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.skyBlue,
          title: Text(I18n.getText(context, 'textAppBarAccount'))),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            injector.get<PasswordPageBloc>()..add(PasswordPageInit()),
        child: PasswordPageWidget(userModel: userModel),
      ),
    );
  }
}

class PasswordPageWidget extends StatefulWidget {
  final UserModel userModel;
  const PasswordPageWidget({this.userModel});

  @override
  _PasswordPageWidgetState createState() => _PasswordPageWidgetState();
}

class _PasswordPageWidgetState extends State<PasswordPageWidget> {
  String _passwordLevel;
  PasswordPageBloc _passwordPageBloc;
  PasswordPageStyle _passwordPageStyle = PasswordPageStyle();
  TextEditingController _passwordController;
  List<ComplexityItemModel> listComplexity;
  bool _isVisible, _isValidPassword;
  UserModel _userModel;

  @override
  void initState() {
    super.initState();
    _userModel = widget.userModel;
    _passwordPageBloc = BlocProvider.of<PasswordPageBloc>(context);
    _passwordController =
        TextInputController((value) => _passwordChanged(value))
            .textEditingController;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordPageBloc, PasswordPageState>(
        cubit: _passwordPageBloc,
        builder: (BuildContext context, PasswordPageState state) {
          _mapState(state);
          return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 70),
          child: Container(
              color: Palette.skyBlue,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleProgress(total: 4, step: 1),
                    ReusableTextView(
                      text: I18n.getText(context, 'textCreatePassword'),
                      style: _passwordPageStyle.passwordTitleTextStyle,
                    ),
                    ReusableTextView(
                      text: I18n.getText(context, 'textCreatePasswordSubtitle'),
                      style: _passwordPageStyle.passwordSubtitleTextStyle,
                    ),
                    ReusableTextField(
                      suffixIcon:
                          Icon(Icons.remove_red_eye, color: Colors.grey),
                      textChangeHandler: _passwordController,
                      hintText: I18n.getText(context, 'textCreatePassword'),
                      obscureText: _isVisible,
                      style: _passwordPageStyle.passwordTextFieldStyle,
                      isValid: true,
                      pressHandler: _changeVisibilityPass,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ReusableTextView(
                            text: I18n.getText(context, 'textComplexity'),
                            style: _passwordPageStyle.complexityTitleTextStyle,
                          ),
                          ReusableTextView(
                            text: _passwordLevel,
                            style: _passwordPageStyle.complexityValueTextStyle,
                          ),
                        ]),
                    _complexityListWidgetItem(),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ReusableButton(
                              isEnabled: _isValidPassword,
                              text: I18n.getText(context, 'textNext'),
                              style:
                                  _passwordPageStyle.submitPasswordButtonStyle,
                              pressHandler: () {
                                _navigateToPersonalInfo();
                              },
                            )))
                  ]))));
        });
  }

  void _navigateToPersonalInfo() {
    Navigator.push(context, personalPageRoute(context, user: _userModel));
  }

  void _mapState(PasswordPageState state) {
    if (state is PasswordPageLoaded) {
      _setComplexityPassword(state);
      _passwordLevel = state.passwordLevel;
      _isVisible = state.isPasswordVisible;
      _isValidPassword = state.isValidPassword;
      _userModel.password = _passwordController.text;
    }
  }

  void _passwordChanged(String value) {
    _passwordPageBloc.add(ChangePasswordValue(value));
  }

  void _changeVisibilityPass() {
    _passwordPageBloc.add(ChangePasswordVisibility(_isVisible));
  }

  void _setComplexityPassword(PasswordPageLoaded state) {
    listComplexity = [];
    listComplexity.add(ComplexityItemModel(
        title: I18n.getText(context, 'textLowercase'),
        aplhabet: 'a',
        isValid: state.isContainLowerCase));
    listComplexity.add(ComplexityItemModel(
        title: I18n.getText(context, 'textUppercase'),
        aplhabet: 'A',
        isValid: state.isContainUppercase));
    listComplexity.add(ComplexityItemModel(
        title: I18n.getText(context, 'textNumber'),
        aplhabet: '123',
        isValid: state.isContainNumber));
    listComplexity.add(ComplexityItemModel(
        title: I18n.getText(context, 'textCharacters'),
        aplhabet: '9+',
        isValid: state.isConatainChar));
  }

  Widget _complexityListWidgetItem() {
    return Container(
        margin: const EdgeInsets.only(top: 50),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listComplexity.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              return _complexityWidgetItem(listComplexity[index]);
            }));
  }

  Widget _complexityWidgetItem(ComplexityItemModel complexityItem) {
    return Column(children: <Widget>[
      if (complexityItem.isValid)
        Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: Image.asset(
              'assets/images/check_icon.png',
              width: 24,
              height: 24,
            )),
      if (!complexityItem.isValid)
        ReusableTextView(
          text: complexityItem.aplhabet,
          style: _passwordPageStyle.complexityItemAlphabetStyle,
        ),
      ReusableTextView(
        text: complexityItem.title,
        style: _passwordPageStyle.complexityItemTextStyle,
      ),
    ]);
  }
}

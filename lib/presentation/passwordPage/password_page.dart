import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_bloc.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_event.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_pahe_state.dart';
import 'package:ginFinans/presentation/passwordPage/style/password_page_style.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_textfield.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/reusableUi/text_input_widget_controller.dart';
import 'package:ginFinans/util/i18n.dart';
import 'package:ginFinans/util/palette.dart';
import 'package:ginFinans/util/routes.dart';
import 'package:ginFinans/viewModel/complexityItemModel.dart';

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.skyBlue,
          title: Text(I18n.getText(context, 'textAppBarAccount'))),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) =>
            injector.get<PasswordPageBloc>()..add(PasswordPageInit()),
        child: PasswordPageWidget(),
      ),
    );
  }
}

class PasswordPageWidget extends StatefulWidget {
  @override
  _PasswordPageWidgetState createState() => _PasswordPageWidgetState();
}

class _PasswordPageWidgetState extends State<PasswordPageWidget> {
  String _passwordLevel;
  PasswordPageBloc _passwordPageBloc;
  PasswordPageStyle _passwordPageStyle = PasswordPageStyle();
  TextEditingController _passwordController;
  List<ComplexityItemModel> listComplexity;
  bool _isVisible;

  @override
  void initState() {
    super.initState();
    _passwordLevel = '';
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
          return Container(
              color: Palette.skyBlue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ReusableTextView(
                      text: I18n.getText(context, 'textCreatePassword'),
                      style: _passwordPageStyle.passwordTitleTextStyle,
                    ),
                    ReusableTextView(
                      text: I18n.getText(context, 'textWelcomeSubtitle'),
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
                    Row(children: <Widget>[
                      ReusableTextView(
                        text: I18n.getText(context, 'textComplexity'),
                        style: _passwordPageStyle.complexityTitleTextStyle,
                      ),
                      ReusableTextView(
                        text: 'Weak',
                        style: _passwordPageStyle.complexityTitleTextStyle,
                      ),
                    ]),
                    _complexityListWidgetItem(),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ReusableButton(
                              text: I18n.getText(context, 'textNext'),
                              style: _passwordPageStyle.submitEmailButtonStyle,
                              pressHandler: () {
                                Navigator.push(
                                    context, personalPageRoute(context));
                              },
                            )))
                  ]));
        });
  }

  void _mapState(PasswordPageState state) {
    if (state is PasswordPageLoaded) {
      _setComplexityPassword(state);
      _isVisible = state.isPasswordVisible;
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

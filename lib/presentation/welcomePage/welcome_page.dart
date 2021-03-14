import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_bloc.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_event.dart';
import 'package:ginFinans/presentation/welcomePage/style/welcome_page_style.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_textfield.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/reusableUi/text_input_widget_controller.dart';

import 'package:ginFinans/util/i18n.dart';
import 'package:ginFinans/util/routes.dart';

import 'bloc/welcome_page_state.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) =>
            injector.get<WelcomePageBloc>()..add(WelcomeInit()),
        child: WelcomePageWidget(),
      ),
    );
  }
}

class WelcomePageWidget extends StatefulWidget {
  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  WelcomePageBloc _welcomePageBloc;
  WelcomePageStyle _welcomePageStyle = WelcomePageStyle();
  TextEditingController _emailController;
  bool _isValidEmail = true;
  String _email;

  @override
  void initState() {
    super.initState();
    _emailController = TextInputController((value) => _emailChanged(value))
        .textEditingController;
    _welcomePageBloc = BlocProvider.of<WelcomePageBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomePageBloc, WelcomePageState>(
        cubit: _welcomePageBloc,
        builder: (BuildContext context, WelcomePageState state) {
          _mapState(state);
          return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ReusableTextView(
              text: I18n.getText(context, 'textWelcomeSubtitle'),
              style: _welcomePageStyle.welcomeSubtitleTextStyle,
            ),
            ReusableTextField(
              textChangeHandler: _emailController,
              hintText: I18n.getText(context, 'textEmail'),
              prefixIcon: Icon(Icons.email, color: Colors.grey),
              obscureText: false,
              style: _welcomePageStyle.emailStyle,
              isValid: _isValidEmail,
              errorText: 'Please enter a valid Email',
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ReusableButton(
                      text: I18n.getText(context, 'textNext'),
                      style: _welcomePageStyle.submitEmailButtonStyle,
                      pressHandler: () {
                        Navigator.push(context, passwordPageRoute(context));
                      },
                    )))
          ]);
        });
  }

  void _emailChanged(String email) {
    _welcomePageBloc.add(ChangeEmail(email: email));
  }

  void _mapState(WelcomePageState state) {
    if (state is EmailChanged) {
      _isValidEmail = state.isValid;
      _email = state.email;
    }
  }
}

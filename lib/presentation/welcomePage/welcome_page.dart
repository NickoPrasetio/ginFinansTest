import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_bloc.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_event.dart';
import 'package:ginFinans/presentation/welcomePage/style/welcome_page_style.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_textfield.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';

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

  @override
  void initState() {
    super.initState();
    _welcomePageBloc = BlocProvider.of<WelcomePageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomePageBloc, WelcomePageState>(
        cubit: _welcomePageBloc,
        builder: (BuildContext context, WelcomePageState state) {
          return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ReusableTextView(
              text: I18n.getText(context, 'textWelcomeSubtitle'),
              style: _welcomePageStyle.welcomeSubtitleTextStyle,
            ),
            ReusableTextField(
              hintText: I18n.getText(context, 'textEmail'),
              style: _welcomePageStyle.emailStyle,
              isValid: false,
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
}

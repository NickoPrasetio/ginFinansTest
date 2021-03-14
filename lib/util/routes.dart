import 'package:flutter/widgets.dart';
import 'package:ginFinans/presentation/passwordPage/password_page.dart';
import 'package:ginFinans/presentation/personailInfoPage/personal_page.dart';
import 'package:ginFinans/presentation/schedulePage/schedule_page.dart';
import 'package:ginFinans/util/one_routes.dart';
import 'package:ginFinans/viewModel/user_model.dart';
    
OneRoute passwordPageRoute(BuildContext context, {UserModel user}) =>
    OneRoute(builder: (context) => PasswordPage(userModel: user));

OneRoute personalPageRoute(BuildContext context) =>
    OneRoute(builder: (context) => PersonalPage());

OneRoute schedulePageRoute(BuildContext context) =>
    OneRoute(builder: (context) => SchedulePage());


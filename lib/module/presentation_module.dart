import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_bloc.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_bloc.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_bloc.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_bloc.dart';


void presentationModule() {
  injector.registerFactory(() => WelcomePageBloc());
  injector.registerFactory(() => PasswordPageBloc());
  injector.registerFactory(() => PersonalPageBloc());
  injector.registerFactory(() => SchedulePageBloc());
}

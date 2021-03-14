import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_event.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_state.dart';
import 'package:ginFinans/util/regex_pattern.dart';


class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(InitLoaded(false));


  @override
  Stream<WelcomePageState> mapEventToState(WelcomePageEvent event) async* {
    if (event is WelcomeInit){
      yield InitLoaded(false);
    }
    if (event is ChangeEmail) {
      bool isValidEmail = RegExp(RegexPattern.regexEmail).hasMatch(event.email);
      yield EmailChanged(isValid: isValidEmail);
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_event.dart';
import 'package:ginFinans/presentation/welcomePage/bloc/welcome_page_state.dart';


class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(InitLoaded(false));


  @override
  Stream<WelcomePageState> mapEventToState(WelcomePageEvent event) async* {
    if (event is WelcomeInit){
      yield InitLoaded(false);
    }
    if (event is ChangeEmail) {
      bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(event.email);
      yield EmailChanged(isValid: isValidEmail);
    }
  }
}
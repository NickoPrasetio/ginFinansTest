import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_event.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_pahe_state.dart';



class PasswordPageBloc extends Bloc<PasswordPageEvent, PasswordPageState> {
  PasswordPageBloc() : super(PasswordPageLoaded());

  @override
  Stream<PasswordPageState> mapEventToState(PasswordPageEvent event) async* {
    if (event is PasswordPageInit){
      yield PasswordPageLoaded(isPasswordVisible: false);
    } else if (event is ChangePasswordVisibility){
      yield PasswordPageLoaded(isPasswordVisible: !event.isVisible);
    }
  }
}
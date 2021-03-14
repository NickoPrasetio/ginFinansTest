import 'package:equatable/equatable.dart';

abstract class WelcomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitLoaded extends WelcomePageState {
  final bool isButtonEnable;
  InitLoaded(this.isButtonEnable);
}

class EmailChanged extends WelcomePageState {
  final String email;
  EmailChanged(this.email);
}

class EmailSubmited extends WelcomePageState {
  final String email;
  EmailSubmited(this.email);
}

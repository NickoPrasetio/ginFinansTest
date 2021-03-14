import 'package:equatable/equatable.dart';

abstract class WelcomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WelcomeInit extends WelcomePageEvent {}

class ChangeEmail extends WelcomePageEvent {
  final String email;
  ChangeEmail(this.email);
}

class SubmitEmail extends WelcomePageEvent {
  final String email;
  SubmitEmail(this.email);
}

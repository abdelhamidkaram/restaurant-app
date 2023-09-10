part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

part of 'my_orders_cubit.dart';

abstract class MyOrdersState extends Equatable {
  const MyOrdersState();
}

class OrderInitial extends MyOrdersState {
  @override
  List<Object> get props => [];
}

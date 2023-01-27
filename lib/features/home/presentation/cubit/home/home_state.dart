part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class RateInitial extends HomeState {}

class RateRequested extends HomeState {}

class RateSucceded extends HomeState {}

class RateFailed extends HomeState {}

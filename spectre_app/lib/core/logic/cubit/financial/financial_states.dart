part of 'financial_cubit.dart';

abstract class FinancialStates {}

class FinancialInitial extends FinancialStates {}

class FinancialLoading extends FinancialStates {}

class FinancialSuccess<T> extends FinancialStates {
  final T data;

  FinancialSuccess(this.data);
}

class FinancialError extends FinancialStates {
  final String message;

  FinancialError(this.message);
}
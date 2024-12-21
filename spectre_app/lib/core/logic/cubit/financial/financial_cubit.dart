import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../models/financial_model.dart';
import '../../../models/page.dart';
import '../../../services/http/financial_service.dart';

part 'financial_states.dart';

class FinancialCubit extends Cubit<FinancialStates> {
  FinancialCubit() : super(FinancialInitial());

  final FinancialService _financialService = FinancialService();
  final List<FinancialModel> _financials = [];
  int _page = 0;
  bool _isFetching = false;
  bool _isLastPage = false;

  Future<void> findAll() async {
    emit(FinancialLoading());

    try {
      final Page<FinancialModel> financial = await _financialService.findAll(page: _page);

      _financials.addAll(financial.content);

      emit(FinancialSuccess<List<FinancialModel>>(_financials));
    } catch (e) {
      if (e is SocketException) {
        emit(FinancialError('No internet connection'));
      } else if (e is HttpException) {
        emit(FinancialError('Server error: ${e.message}'));
      } else {
        emit(FinancialError(e.toString()));
      }
    }
  }

  Future<void> fetchNextPage() async {
    if (_isFetching || _isLastPage) return;

    _isFetching = true;

    try {
      final financial = await _financialService.findAll(page: _page);

      if (financial.content.isNotEmpty) {
        _financials.addAll(financial.content);
        emit(FinancialSuccess(_financials));
      }

      _isLastPage = financial.last;
      _page++;
    } catch (e) {
      emit(FinancialError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> findById(int id) async {
    emit(FinancialLoading());

    try {
      final financial = await _financialService.findById(id);
      emit(FinancialSuccess<FinancialModel>(financial));
    } catch (e) {
      if (e is SocketException) {
        emit(FinancialError('No internet connection'));
      } else if (e is HttpException) {
        emit(FinancialError('Server error: ${e.message}'));
      } else {
        emit(FinancialError(e.toString()));
      }
    }
  }

  Future<void> create(FinancialModel financialModel) async {
    emit(FinancialLoading());

    try {
      final financial = await _financialService.create(financialModel);
      emit(FinancialSuccess<FinancialModel>(financial));
    } catch (e) {
      if (e is SocketException) {
        emit(FinancialError('No internet connection'));
      } else if (e is HttpException) {
        emit(FinancialError('Server error: ${e.message}'));
      } else {
        emit(FinancialError(e.toString()));
      }
    }
  }

  Future<void> update(FinancialModel financialModel) async {
    emit(FinancialLoading());

    try {
      final financial = await _financialService.update(financialModel);
      emit(FinancialSuccess<FinancialModel>(financial));
    } catch (e) {
      if (e is SocketException) {
        emit(FinancialError('No internet connection'));
      } else if (e is HttpException) {
        emit(FinancialError('Server error: ${e.message}'));
      } else {
        emit(FinancialError(e.toString()));
      }
    }
  }

  Future<void> delete(int id) async {
    emit(FinancialLoading());

    try {
      await _financialService.delete(id);
      emit(FinancialSuccess<void>(null));
    } catch (e) {
      if (e is SocketException) {
        emit(FinancialError('No internet connection'));
      } else if (e is HttpException) {
        emit(FinancialError('Server error: ${e.message}'));
      } else {
        emit(FinancialError(e.toString()));
      }
    }
  }
}

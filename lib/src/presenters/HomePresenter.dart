import 'package:flutter/material.dart';
import '../models/FuncModel.dart';
import '../repositories/func_repository.dart';

abstract class HomeContract {
  homeSuccess();
  homeError();
  loading();
  loadingManagement();
}

class homePresenter {

  final HomeContract homeContract;

  FuncRepository _funcRepository = FuncRepository();
  
  final state = ValueNotifier<HomeState>(HomeState.error);
  final deleteState = ValueNotifier<DeleteState>(DeleteState.start);

  bool isLoading = false;

  List<FuncModel> funcList = [];
 
  homePresenter(this.homeContract);

  homeManangement(user, password) async {
    late bool result;

    state.value = HomeState.loading;
    isLoading = true;
    homeContract.loadingManagement();
    try {
      funcList = await _funcRepository.fetchFuncList();

      if (funcList.length > 0) {
        homeContract.homeSuccess();
      }

    } catch (e) {
      state.value = HomeState.error;
    }
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.success:
        return homeContract.homeSuccess();
      case HomeState.loading:
        return homeContract.loading();
      case HomeState.error:
        return homeContract.homeError();
    }
  }
}

enum HomeState {success, error, loading} 
enum DeleteState {start, error} 
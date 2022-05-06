import 'package:flutter/material.dart';
import '../models/FuncModel.dart';
import '../repositories/func_repository.dart';

abstract class HomeContract {
  homeSuccess();
  homeError();
  loading();
  loadingManagement();
  alert(int id);
}

class homePresenter {

  final HomeContract homeContract;

  FuncRepository _funcRepository = FuncRepository();
  
  final state = ValueNotifier<HomeState>(HomeState.error);
  final deleteState = ValueNotifier<DeleteState>(DeleteState.start);

  bool isLoading = false;

  List<FuncModel> funcList = [];
  
  int? id;
 
  homePresenter(this.homeContract);

  start() async {
    try {
      funcList = await _funcRepository.fetchFuncList();

      if (funcList.length > 0) {
        state.value = HomeState.success;
        print(funcList.length);
      }

    } catch (e) {
      state.value = HomeState.error;
      print(e);
    }
  }

  delete(int? id) async {
    late bool result;

    state.value = HomeState.loading;
    isLoading = true;
    homeContract.loadingManagement();

    try {
      result = await _funcRepository.fetchDeleteFunc(id!);

      if (!result) {
        isLoading = false;
        homeContract.loadingManagement();
        start();
      }
    } catch (e) {
      deleteState.value = DeleteState.error;
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
      case HomeState.alert:
        return homeContract.alert(id!);
    }
  }
}

enum HomeState {success, error, loading, alert} 
enum DeleteState {start, error} 
import 'package:emplox/src/repositories/func_repository.dart';
import 'package:flutter/material.dart';

abstract class UpdateFuncContract {
  Start();
  Loading();
  Success();
  Error();
  loadingManagement();
}

class UpdateFuncPresenter {

  final UpdateFuncContract updateFuncContract;

  FuncRepository _funcRepository = FuncRepository();
  
  final state = ValueNotifier<UpdateFuncState>(UpdateFuncState.start);

  bool isLoading = false;

  UpdateFuncPresenter(this.updateFuncContract);

  TextEditingController name = TextEditingController();
  TextEditingController role = TextEditingController();

  updateFuncManangement(name, role, id) async {
    late bool isRegister;

    state.value = UpdateFuncState.loading;
    isLoading = true;
    updateFuncContract.loadingManagement();
    try {
      print("oioioi");
      isRegister = await _funcRepository.fetchUpdateFunc(name, role, id);
      print(isRegister);

      if (!isRegister) {
        isLoading = false;
        updateFuncContract.loadingManagement();
        print("isRegister: $isRegister");
        updateFuncContract.Success();
      }

    } catch (e) {
      state.value = UpdateFuncState.error;
      print(e);
    }
  }

  stateManagement(UpdateFuncState state) {
    switch (state) {
      case UpdateFuncState.start:
        return updateFuncContract.Start();
      case UpdateFuncState.loading:
        return updateFuncContract.Loading();
      case UpdateFuncState.error:
        return updateFuncContract.Error();
    }
  }
}

enum UpdateFuncState {start, error, loading} 
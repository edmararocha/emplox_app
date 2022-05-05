import 'package:emplox/src/repositories/func_repository.dart';
import 'package:flutter/material.dart';

abstract class AddFuncContract {
  Start();
  Loading();
  Success();
  Error();
  loadingManagement();
}

class AddFuncPresenter {

  final AddFuncContract addFuncContract;

  FuncRepository _funcRepository = FuncRepository();
  
  final state = ValueNotifier<AddFuncState>(AddFuncState.start);

  bool isLoading = false;

  AddFuncPresenter(this.addFuncContract);

  TextEditingController name = TextEditingController();
  TextEditingController role = TextEditingController();

  registerManangement(name, role) async {
    late bool isRegister;

    state.value = AddFuncState.loading;
    isLoading = true;
    addFuncContract.loadingManagement();
    try {
      print("oioioi");
      isRegister = await _funcRepository.fetchFuncRegister(name, role);
      print(isRegister);

      if (!isRegister) {
        isLoading = false;
        addFuncContract.loadingManagement();
        print("isRegister: $isRegister");
        addFuncContract.Success();
      }

    } catch (e) {
      state.value = AddFuncState.error;
    }
  }

  stateManagement(AddFuncState state) {
    switch (state) {
      case AddFuncState.start:
        return addFuncContract.Start();
      case AddFuncState.loading:
        return addFuncContract.Loading();
      case AddFuncState.error:
        return addFuncContract.Error();
    }
  }
}

enum AddFuncState {start, error, loading} 
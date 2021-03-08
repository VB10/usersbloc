import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/reqres_model.dart';
import '../../service/IUserService.dart';

class UsersCubit extends Cubit<UsersState> {
  final IUserService userService;

  late List<Data> dataItems;

  bool isPagingLoading = false;

  UsersCubit(this.userService) : super(UsersInitial()) {
    _pageNumber = 1;
    fetchUserItem();
  }

  late int _pageNumber;
  Future<void> fetchUserItem() async {
    emit(UsersLoadingState(true));
    final items = await userService.fetchUserData(page: _pageNumber);

    if (items.isEmpty) {
      emit(UsersItemsErrorState());
    } else {
      emit(UsersListItemState(items));
    }
    dataItems = items;
  }

  Future<void> fetchUserItemPaging() async {
    _changeLoading();
    emit(UsersListItemState(dataItems));
    if (isPagingLoading) {
      return;
    }
    _pageNumber += 1;
    final items = await userService.fetchUserData(page: _pageNumber);
    _changeLoading();

    dataItems.addAll(items);

    emit(UsersListItemState(dataItems));
  }

  void _changeLoading() {
    isPagingLoading = !isPagingLoading;
  }
}

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {
  final bool isLoading;

  UsersLoadingState(this.isLoading);
}

class UsersListItemState extends UsersState {
  final List<Data> items;

  UsersListItemState(this.items);
}

class UsersItemsErrorState extends UsersState {
  UsersItemsErrorState();
}

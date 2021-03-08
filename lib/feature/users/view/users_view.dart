import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/constants/project_constat.dart';
import '../../../product/exeption/widget_not_found_exception.dart';
import '../service/user_service.dart';
import '../viewmodel/cubit/userscubit_state.dart';
import 'sub_view/states_widget.dart';

class UsersView extends StatelessWidget {
  final userCubit = UsersCubit(UserService(ProjectConstants.instance.networkManager));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => userCubit,
      child: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UsersItemsErrorState) {}
          if (state is UsersInitial) {
            state.navigate();
          }
        },
        builder: (context, state) {
          return buildScaffold(state, context);
        },
      ),
    );
  }

  Scaffold buildScaffold(UsersState state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildPaddingLeading(context),
      ),
      body: buildBodyText(state),
    );
  }

  Padding buildPaddingLeading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: context.watch<UsersCubit>().isPagingLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).scaffoldBackgroundColor),
            )
          : Text('data'),
    );
  }

  Widget buildBodyText(UsersState state) {
    if (state is UsersInitial) {
      return state.buildWidget();
    } else if (state is UsersLoadingState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is UsersListItemState) {
      return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
              // context.read
              final _context = notification.context;
              if (_context != null) {
                _context.read<UsersCubit>().fetchUserItemPaging();
              }
            }
            return true;
          },
          child: state.buildWidget());
    }
    throw WidgetNotFoundException<UsersView, UsersState>(state);
  }
}

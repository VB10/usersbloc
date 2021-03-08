import 'package:flutter/material.dart';

import '../../../../product/constants/application_constant.dart';
import '../../viewmodel/cubit/userscubit_state.dart';

extension UsersInitialWidget on UsersInitial {
  void navigate() {}
  Widget buildWidget() {
    return Text('OOKEy');
  }
}

extension UsersListItemWidget on UsersListItemState {
  void _navigate() {}
  Widget buildWidget() {
    return Scrollbar(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(items[index].avatar ?? ApplicationConstats.DAFAULT_IMAGE_URL),
                ),
                title: Text(items[index].email ?? ''),
              ),
            );
          }),
    );
  }
}

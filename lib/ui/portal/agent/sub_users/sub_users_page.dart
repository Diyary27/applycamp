import 'package:applycamp/ui/portal/agent/sub_users/bloc/sub_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubUsersPage extends StatelessWidget {
  const SubUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Users'),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = SubUsersBloc();
          bloc.add(SubUserStarted());
          bloc.stream.listen((state) {});
          return bloc;
        },
        child: BlocBuilder<SubUsersBloc, SubUsersState>(
          builder: (context, state) {
            if (state is SubUsersInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SubUsersLoaded) {
              return SingleChildScrollView(
                child: Column(),
              );
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}

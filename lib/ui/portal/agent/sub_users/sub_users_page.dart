import 'package:applycamp/domain/entity/sub_user.dart';
import 'package:applycamp/ui/portal/agent/darwer.dart';
import 'package:applycamp/ui/portal/agent/sub_users/add_sub_user_form.dart';
import 'package:applycamp/ui/portal/agent/sub_users/bloc/sub_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubUsersPage extends StatelessWidget {
  SubUsersPage({super.key});
  final GlobalKey _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Sub Users'),
      ),
      drawer: AgentDrawer(),
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // add subuser
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SubUserForm()));
                        if (result != null) {
                          context
                              .read<SubUsersBloc>()
                              .add(SubUsersAddClicked(result));
                        }
                      },
                      child: Text('+ Add SubUser'),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.subUsers.length,
                        itemBuilder: (context, index) {
                          final subUser = state.subUsers[index];
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  minRadius: 40,
                                  maxRadius: 40,
                                  backgroundImage: NetworkImage(
                                    'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        subUser.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(height: 3),
                                      Text('Email: ' + subUser.email),
                                      Text('Phone: ' + subUser.phone),
                                      Text('Organization: ' +
                                          subUser.organization),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        final SubUserEntity subUserEntity =
                                            SubUserEntity(
                                          name: subUser.name,
                                          password: '',
                                          email: subUser.email,
                                          organization: subUser.organization,
                                          phone: subUser.phone,
                                          commissionPercentage:
                                              subUser.commissionPercentage,
                                          canViewCommissions:
                                              subUser.canViewCommissions,
                                          canAddSubUsers:
                                              subUser.canAddSubUsers,
                                        );
                                        final result =
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubUserForm(
                                                          subUserEntity:
                                                              subUserEntity,
                                                        )));
                                        context
                                            .read<SubUsersBloc>()
                                            .add(SubUsersUpdateClicked(result));
                                      },
                                      child: Icon(Icons.edit),
                                    ),
                                    SizedBox(height: 10),
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
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

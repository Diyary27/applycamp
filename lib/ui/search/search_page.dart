import 'package:applycamp/ui/components/app_bar.dart';
import 'package:applycamp/ui/components/drawer.dart';
import 'package:applycamp/ui/search/bloc/search_bloc.dart';
import 'package:applycamp/ui/search/programs_list_page.dart';
import 'package:applycamp/ui/search/programs_search_form.dart';
import 'package:applycamp/ui/search/university_list_page.dart';
import 'package:applycamp/ui/search/university_search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) {
            final searchBloc = SearchBloc();
            searchBloc.add(SearchPageStarted());
            return searchBloc;
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchPageLoaded) {
                return Scaffold(
                  appBar: TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                        'Programs',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                      Tab(
                          child: Text(
                        'Universities',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      ProgramsSearchForm(state: state),
                      UniversitySearchForm(state: state),
                    ],
                  ),
                );
              } else if (state is SearchProgramSuccess) {
                return ProgramsListPage(
                  schoolPrograms: state.schoolPrograms,
                );
              } else if (state is SearchUniSuccess) {
                return UniversityListPage(
                    cities: state.cities, schools: state.schools);
              } else {
                return Center(child: Text(state.toString()));
              }
            },
          ),
        ),
      ),
    );
  }
}

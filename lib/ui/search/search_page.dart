import 'package:applycamp/ui/app_bar.dart';
import 'package:applycamp/ui/drawer.dart';
import 'package:applycamp/ui/search/programs_search_form.dart';
import 'package:applycamp/ui/search/university_search_form.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    MultiValueDropDownController _levelController =
        MultiValueDropDownController();
    MultiValueDropDownController _languageController =
        MultiValueDropDownController();
    MultiValueDropDownController _uniTypeController =
        MultiValueDropDownController();
    MultiValueDropDownController _cityController =
        MultiValueDropDownController();
    MultiValueDropDownController _uniNameController =
        MultiValueDropDownController();
    TextEditingController _minPriceController = TextEditingController();
    TextEditingController _maxPriceController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
    }

    final List<DropDownValueModel> dummyList = [
      DropDownValueModel(name: 'Bachelor', value: 'a'),
      DropDownValueModel(name: 'Associate', value: 'b'),
      DropDownValueModel(name: 'Master', value: 'c'),
      DropDownValueModel(name: 'PhD', value: 'e'),
    ];
    final List<String> dummyPrograms = [
      'asd',
      'asf',
      'kels',
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
              ProgramsSearchForm(
                  levelController: _levelController,
                  dummyList: dummyList,
                  languageController: _languageController,
                  uniTypeController: _uniTypeController,
                  cityController: _cityController,
                  uniNameController: _uniNameController,
                  minPriceController: _minPriceController,
                  maxPriceController: _maxPriceController,
                  dummyPrograms: dummyPrograms),
              UniversitySearchForm(
                  uniTypeController: _uniTypeController,
                  dummyList: dummyList,
                  cityController: _cityController,
                  dummyPrograms: dummyPrograms)
            ],
          ),
        ),
      ),
    );
  }
}

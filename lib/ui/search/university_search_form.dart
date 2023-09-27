import 'package:applycamp/ui/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class UniversitySearchForm extends StatelessWidget {
  UniversitySearchForm({super.key, required this.state});

  final SearchPageLoaded state;

  final MultiSelectController _uniTypeController = MultiSelectController();
  final MultiSelectController _cityController = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Field : UniversityType
          MultiSelectDropDown(
            hint: "University Type",
            controller: _uniTypeController,
            onOptionSelected: (options) {},
            options: state.schoolTypes,
          ),
          SizedBox(height: 16),
          // Field : City
          MultiSelectDropDown(
            hint: "City",
            controller: _cityController,
            onOptionSelected: (options) {},
            options: state.cities,
          ),
          SizedBox(height: 16),
          Autocomplete(
            optionsBuilder: (optionsBuilder) {
              return state.specialities.where((element) => element
                  .toLowerCase()
                  .startsWith(optionsBuilder.text.toLowerCase()));
            },
            fieldViewBuilder: (context, programTextEditingController, focusNode,
                onFieldSubmitted) {
              return TextField(
                controller: programTextEditingController,
                focusNode: focusNode,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(
                    'University Name',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                  filled: true,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                fixedSize: MaterialStatePropertyAll(Size(120, 40))),
            onPressed: () {
              context.read<SearchBloc>().add(SearchUniBtnClicked(
                    cities: _cityController.selectedOptions,
                    keyWords: '',
                    schoolTypes: _uniTypeController.selectedOptions,
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                Text('search'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

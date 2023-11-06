import 'package:applycamp/ui/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ProgramsSearchForm extends StatelessWidget {
  ProgramsSearchForm({super.key, required this.state});

  final SearchPageLoaded state;

  final MultiSelectController _degreeController = MultiSelectController();
  final MultiSelectController _languageController = MultiSelectController();
  final MultiSelectController _uniTypeController = MultiSelectController();
  final MultiSelectController _cityController = MultiSelectController();
  final MultiSelectController _uniNameController = MultiSelectController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  final TextEditingController _keyWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Field : Education Level
            MultiSelectDropDown(
              hint: "Education Level",
              controller: _degreeController,
              onOptionSelected: (options) {},
              options: state.degrees,
            ),
            const SizedBox(height: 16),
            // Field : Education Language
            MultiSelectDropDown(
              hint: "Education Language",
              controller: _languageController,
              onOptionSelected: (options) {},
              options: state.languages,
            ),
            const SizedBox(height: 16),
            // Field : UniversityType
            MultiSelectDropDown(
              hint: "University Type",
              controller: _uniTypeController,
              onOptionSelected: (options) {},
              options: state.schoolTypes,
            ),
            const SizedBox(height: 16),
            // Field : City
            MultiSelectDropDown(
              hint: "City",
              controller: _cityController,
              onOptionSelected: (options) {},
              options: state.cities,
            ),
            const SizedBox(height: 16),
            // Field : University
            MultiSelectDropDown(
              hint: "University",
              controller: _uniNameController,
              onOptionSelected: (options) {},
              options: state.universities,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Field : Min Price
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: _minPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text(
                        'Min Price',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      filled: true,
                      suffixText: 'USD',
                    ),
                  ),
                ),
                // Field : Max Price
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: _maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text(
                        'Max Price',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      filled: true,
                      suffixText: 'USD',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Field : Programs
            Autocomplete(
              optionsBuilder: (optionsBuilder) {
                return state.specialities.where((element) => element
                    .toLowerCase()
                    .startsWith(optionsBuilder.text.toLowerCase()));
              },
              fieldViewBuilder: (context, specialityController, focusNode,
                  onFieldSubmitted) {
                return TextField(
                  controller: specialityController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Programs',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                    filled: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                  fixedSize: const MaterialStatePropertyAll(Size(120, 40))),
              onPressed: () {
                context.read<SearchBloc>().add(SearchProgramBtnClicked(
                      degrees: _degreeController.selectedOptions,
                      languages: _languageController.selectedOptions,
                      schoolTypes: _uniTypeController.selectedOptions,
                      cities: _cityController.selectedOptions,
                      universities: _uniNameController.selectedOptions,
                      minPrice: int.tryParse(_minPriceController.text),
                      maxPrice: int.tryParse(_maxPriceController.text),
                      keyWords: _keyWordController.text,
                    ));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Text('search'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class UniversitySearchForm extends StatelessWidget {
  const UniversitySearchForm({
    super.key,
    required MultiValueDropDownController uniTypeController,
    required this.dummyList,
    required MultiValueDropDownController cityController,
    required this.dummyPrograms,
  })  : _uniTypeController = uniTypeController,
        _cityController = cityController;

  final MultiValueDropDownController _uniTypeController;
  final List<DropDownValueModel> dummyList;
  final MultiValueDropDownController _cityController;
  final List<String> dummyPrograms;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // university type field
          DropDownTextField.multiSelection(
            controller: _uniTypeController,
            displayCompleteItem: true,
            dropDownList: dummyList,
            submitButtonColor: Theme.of(context).colorScheme.primary,
            submitButtonTextStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
            textFieldDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text(
                'University Type',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              ),
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          // city field
          DropDownTextField.multiSelection(
            controller: _cityController,
            displayCompleteItem: true,
            dropDownList: dummyList,
            submitButtonColor: Theme.of(context).colorScheme.primary,
            submitButtonTextStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
            textFieldDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text(
                'City',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              ),
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Autocomplete(
            optionsBuilder: (optionsBuilder) {
              return dummyPrograms.where((element) => element
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
            onPressed: () {},
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

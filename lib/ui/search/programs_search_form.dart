import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class ProgramsSearchForm extends StatelessWidget {
  const ProgramsSearchForm({
    super.key,
    required MultiValueDropDownController levelController,
    required this.dummyList,
    required MultiValueDropDownController languageController,
    required MultiValueDropDownController uniTypeController,
    required MultiValueDropDownController cityController,
    required MultiValueDropDownController uniNameController,
    required TextEditingController minPriceController,
    required TextEditingController maxPriceController,
    required this.dummyPrograms,
  })  : _levelController = levelController,
        _languageController = languageController,
        _uniTypeController = uniTypeController,
        _cityController = cityController,
        _uniNameController = uniNameController,
        _minPriceController = minPriceController,
        _maxPriceController = maxPriceController;

  final MultiValueDropDownController _levelController;
  final List<DropDownValueModel> dummyList;
  final MultiValueDropDownController _languageController;
  final MultiValueDropDownController _uniTypeController;
  final MultiValueDropDownController _cityController;
  final MultiValueDropDownController _uniNameController;
  final TextEditingController _minPriceController;
  final TextEditingController _maxPriceController;
  final List<String> dummyPrograms;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Field 1
            DropDownTextField.multiSelection(
              controller: _levelController,
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
                  'Education Level',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Field 2
            DropDownTextField.multiSelection(
              controller: _languageController,
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
                  'Education Language',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Field 3
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
            // Field 4
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
            // Field 5
            DropDownTextField.multiSelection(
              controller: _uniNameController,
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
                  'University',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Field 6
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
                // Field 7
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
            SizedBox(height: 16),
            // Field 8
            Autocomplete(
              optionsBuilder: (optionsBuilder) {
                return dummyPrograms.where((element) => element
                    .toLowerCase()
                    .startsWith(optionsBuilder.text.toLowerCase()));
              },
              fieldViewBuilder: (context, programTextEditingController,
                  focusNode, onFieldSubmitted) {
                return TextField(
                  controller: programTextEditingController,
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
      ),
    );
  }
}

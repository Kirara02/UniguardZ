import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class PickListField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final Function(T?) onChanged;
  final bool isRequired;
  final String Function(T)? itemAsString;
  final String? hintText;

  const PickListField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.isRequired = false,
    this.itemAsString,
    this.hintText = "Select",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isRequired) const Text("* ", style: TextStyle(color: Colors.red)),
              Text(label, style: Typogaphy.Medium),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(color: AppColors.dark),
            child: DropdownSearch<T>(
              popupProps: PopupProps.menu(
                menuProps: MenuProps(
                  backgroundColor: AppColors.primarySoft,
                ),
                showSearchBox: false,
                showSelectedItems: true,
                fit: FlexFit.loose,
                itemBuilder: (context, item, isSelected) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.primaryExtraSoft, width: 1),
                      ),
                    ),
                    child: Text(
                      itemAsString?.call(item) ?? item.toString(),
                      style: Typogaphy.Regular.copyWith(
                          fontSize: 14, color: isSelected ? AppColors.secondary : Colors.white),
                    ),
                  );
                },
              ),
              items: items,
              itemAsString: itemAsString ?? (item) => item.toString(),
              compareFn: (T? item, T? selectedItem) => item == selectedItem,
              onChanged: onChanged,
              selectedItem: value,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  hintText: hintText,
                  hintStyle: Typogaphy.Regular.copyWith(fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
              validator: (value) {
                if (isRequired && value == null) {
                  return 'Field $label is required';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

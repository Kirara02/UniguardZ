import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
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
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.tertiary, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                if (isRequired)
                  const TextSpan(
                    text: "* ",
                    style: TextStyle(color: Colors.red),
                  ),
                TextSpan(
                  text: label,
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.light,
                  ),
                ),
              ],
            ),
            softWrap: true, // Allow text wrapping
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(color: colorScheme.tertiaryContainer),
            child: DropdownSearch<T>(
              popupProps: PopupProps.menu(
                menuProps: MenuProps(
                  backgroundColor: colorScheme.surfaceContainer,
                ),
                showSearchBox: false,
                showSelectedItems: true,
                fit: FlexFit.loose,
                itemBuilder: (context, item, isSelected) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colorScheme.outline,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      itemAsString?.call(item) ?? item.toString(),
                      style: Typogaphy.Regular.copyWith(
                          fontSize: 14,
                          color:
                              isSelected ? Colors.blue : colorScheme.onSurface),
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
                baseStyle: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.light,
                ),
                dropdownSearchDecoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  hintText: hintText,
                  hintStyle: textTheme.labelMedium!.copyWith(
                    color: AppColors.light,
                  ),
                  suffixIconColor: AppColors.light,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/paginated_dropdown_cubit.dart';
import 'cubit/paginated_dropdown_state.dart';
import 'components/dropdown_bottom_sheet.dart';

class PaginatedSearchDropdown<T> extends StatelessWidget {
  const PaginatedSearchDropdown({
    super.key,
    required this.cubit,
    required this.itemAsString,
    this.itemBuilder,
    this.onSelecte,
    required this.title
  });
  final String title;
  final PaginatedDropdownCubit<T> cubit;
  final String Function(T) itemAsString;
  final Widget Function(BuildContext context, T item, bool isSelected)?
  itemBuilder;
  final Function(T)? onSelecte;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedDropdownCubit<T>, PaginatedDropdownState<T>>(
      bloc: cubit,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _openSheet(context),
          child: InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            child: Text(
              state.selectedItem != null
                  ? itemAsString(state.selectedItem as T)
                  : title,
            ),
          ),
        );
      },
    );
  }

  void _openSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: DropdownBottomSheet<T>(
          item: itemAsString,
          itemBuilder: itemBuilder,
          onSelecte: onSelecte,
        ),
      ),
    );
  }
}

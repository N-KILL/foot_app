import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_app/core/buttons/icon_button.dart';
import 'package:foot_app/core/dropdown/custom_dropdown.dart';
import 'package:foot_app/core/page_titles/page_titles.dart';
import 'package:foot_app/core/text/custom_texts.dart';
import 'package:foot_app/core/utils/date_parser.dart';
import 'package:foot_app/l10n/l10n.dart';
import 'package:foot_app/pages/shift_details/shift_details.dart';
import 'package:foot_app/pages/shift_details/view/shift_details_card.dart';
import 'package:go_router/go_router.dart';

class ShiftDetailsPage extends StatelessWidget {
  const ShiftDetailsPage({
    required this.selectedDate,
    super.key,
  });

  final DateTime selectedDate;

  bool isDateDifferenceMoreThan24Hours(DateTime date1, DateTime date2) {
    return date1.difference(date2).abs().inHours > 24;
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != selectedDate && context.mounted) {
        GoRouter.of(context).go(
          '/shifts_details/${pickedDate.toIso8601String()}',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => ShiftsDetailsCubit()
        ..loadShiftsDetailsByDate(
          selectedDate,
          [],
        ),
      child: BlocBuilder<ShiftsDetailsCubit, ShiftsDetailsState>(
        builder: (context, state) {
          if (state is ShiftDetailsLoading || state is ShiftsDetailsInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (state is ShiftsDetailsLoaded) {
            return Column(
              children: [
                PageTitles(
                  // TODO: Add translation
                  pageTitle:
                      'Shifts of ${formatDateYearMonthDate(selectedDate)}',
                  icon: CustomIconButton(
                    icon: Icons.calendar_month,
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () => _showDatePicker(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: selectedDate.isBefore(DateTime.now()) &&
                          selectedDate
                                  .difference(DateTime.now())
                                  .abs()
                                  .inHours >
                              24
                      ? Align(
                          alignment: Alignment.centerRight,
                          child:
                              // TODO(any): Add translation
                              largeText(
                            'Amount of shifts: ${state.shifts.length}',
                            context,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            largeText(
                              // TODO(any): Add translation
                              'Amount of shifts: ${state.shifts.length}',
                              context,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // TODO(any): Add translation
                                largeText('View older', context),
                                Checkbox(
                                  value: state.showOlder,
                                  fillColor: WidgetStateProperty.resolveWith(
                                    (states) =>
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                  onChanged: (bool? value) {
                                    if (value == null) {
                                      return;
                                    }
                                    context
                                        .read<ShiftsDetailsCubit>()
                                        .toggleShowOlderShifts(
                                          newValue: value,
                                        );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                // TODO(any): Make this based on the list of fields availables,
                //  also add the option to no filter
                if (state.listOfFields.length > 1)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomDropdown(
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Cancha 1'),
                        ),
                      ],
                      value: 1,
                      onChanged: (value) {},
                    ),
                  ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 2,
                      ),
                      child: ListView.builder(
                        itemCount: 600,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 175,
                            // TODO(any): Make this read the shift details
                            child: ShiftDetailsCard(
                              title: 'Turno n°: $index',
                              date: selectedDate,
                              pitchName: 'Cancha 1',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          } else {
            return Column(
              children: [
                // TODO(any): Add translation
                largeText(
                  state.errorMessage ?? 'l10n.errorLoadingShifts',
                  context,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ShiftsDetailsCubit>().loadShiftsDetailsByDate(
                      selectedDate,
                      [],
                    );
                  },
                  child: Text(l10n.reloadButton),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

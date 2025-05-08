part of 'shift_details_cubit.dart';

class ShiftsDetailsState extends Equatable {
  const ShiftsDetailsState({
    required this.selectedDate,
    this.listOfFields = const [],
    this.shifts = const [],
    this.errorMessage,
    this.showOlder = false,
    this.isLoading = false,
  });

  final DateTime selectedDate;
  final List<Field> listOfFields;
  final List<String> shifts;
  final String? errorMessage;
  final bool showOlder;
  final bool isLoading;

  ShiftsDetailsState copyWith({
    DateTime? selectedDate,
    List<Field>? listOfFields,
    List<String>? shifts,
    String? errorMessage,
    bool? showOlder,
    bool? isLoading,
  }) {
    return ShiftsDetailsState(
      selectedDate: selectedDate ?? this.selectedDate,
      listOfFields: listOfFields ?? this.listOfFields,
      shifts: shifts ?? this.shifts,
      errorMessage: errorMessage,
      showOlder: showOlder ?? this.showOlder,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        listOfFields,
        shifts,
        errorMessage,
        showOlder,
        isLoading,
      ];
}

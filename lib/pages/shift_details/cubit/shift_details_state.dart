import 'package:foot_app/models/pitch.dart';

abstract class ShiftsDetailsState {
  ShiftsDetailsState({
    required this.selectedDate,
    this.errorMessage,
    this.listOfFields = const [],
    this.shifts = const [],
    this.showOlder = false,
  });

  // Selected day
  final DateTime selectedDate;

  // List of available fields
  final List<Field> listOfFields;

  // Error message
  final String? errorMessage;

  // List of shifts of the selected pitch
  final List<String> shifts;

  // Allow showing older
  final bool showOlder;

  T copyWith<T extends ShiftsDetailsState>({
    DateTime? selectedDate,
    List<Field>? listOfFields,
    String? errorMessage,
    List<String>? shifts,
    bool? showOlder,
  }) {
    return _copyWith(
      selectedDate: selectedDate ?? this.selectedDate,
      listOfFields: listOfFields ?? this.listOfFields,
      errorMessage: errorMessage ?? this.errorMessage,
      shifts: shifts ?? this.shifts,
      showOlder: showOlder ?? this.showOlder,
    ) as T;
  }

  ShiftsDetailsState _copyWith({
    required DateTime selectedDate,
    required List<Field> listOfFields,
    required String? errorMessage,
    required List<String> shifts,
    required bool showOlder,
  });
}

class ShiftDetailsLoading extends ShiftsDetailsState {
  ShiftDetailsLoading({
    required super.selectedDate,
    super.listOfFields,
    super.shifts,
    super.errorMessage,
    super.showOlder,
  });

  @override
  ShiftDetailsLoading _copyWith({
    required DateTime selectedDate,
    required List<Field> listOfFields,
    required String? errorMessage,
    required List<String> shifts,
    required bool showOlder,
  }) {
    return ShiftDetailsLoading(
      selectedDate: selectedDate,
      listOfFields: listOfFields,
      errorMessage: errorMessage,
      shifts: shifts,
      showOlder: showOlder,
    );
  }
}

class ShiftsDetailsLoaded extends ShiftsDetailsState {
  ShiftsDetailsLoaded({
    required super.selectedDate,
    super.listOfFields,
    super.shifts,
    super.errorMessage,
    super.showOlder,
  });

  @override
  ShiftsDetailsLoaded _copyWith({
    required DateTime selectedDate,
    required List<Field> listOfFields,
    required String? errorMessage,
    required List<String> shifts,
    required bool showOlder,
  }) {
    return ShiftsDetailsLoaded(
      selectedDate: selectedDate,
      listOfFields: listOfFields,
      errorMessage: errorMessage,
      shifts: shifts,
      showOlder: showOlder,
    );
  }
}

class ShiftsDetailsError extends ShiftsDetailsState {
  ShiftsDetailsError({
    required super.selectedDate,
    super.listOfFields,
    super.shifts,
    super.errorMessage,
    super.showOlder,
  });

  @override
  ShiftsDetailsError _copyWith({
    required DateTime selectedDate,
    required List<Field> listOfFields,
    required String? errorMessage,
    required List<String> shifts,
    required bool showOlder,
  }) {
    return ShiftsDetailsError(
      selectedDate: selectedDate,
      listOfFields: listOfFields,
      errorMessage: errorMessage,
      shifts: shifts,
      showOlder: showOlder,
    );
  }
}

class ShiftsDetailsInitial extends ShiftsDetailsState {
  ShiftsDetailsInitial({
    required super.selectedDate,
    super.listOfFields,
    super.shifts,
    super.errorMessage,
    super.showOlder,
  });

  @override
  ShiftsDetailsInitial _copyWith({
    required DateTime selectedDate,
    required List<Field> listOfFields,
    required String? errorMessage,
    required List<String> shifts,
    required bool showOlder,
  }) {
    return ShiftsDetailsInitial(
      selectedDate: selectedDate,
      listOfFields: listOfFields,
      errorMessage: errorMessage,
      shifts: shifts,
      showOlder: showOlder,
    );
  }
}

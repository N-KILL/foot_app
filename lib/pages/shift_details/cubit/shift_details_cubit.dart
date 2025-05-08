import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foot_app/models/pitch.dart';

part 'shift_details_state.dart';

class ShiftsDetailsCubit extends Cubit<ShiftsDetailsState> {
  ShiftsDetailsCubit()
      : super(
          ShiftsDetailsState(
            selectedDate: DateTime.now(),
          ),
        );

  Future<void> loadShiftsDetailsByDate(
    DateTime selectedDate,
    List<Field> listOfFields,
  ) async {
    emit(
      ShiftsDetailsState(
        selectedDate: selectedDate,
        listOfFields: listOfFields,
      ),
    );
    // TODO(any): Remove timer once have backend
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(
      ShiftsDetailsState(
        selectedDate: state.selectedDate,
        listOfFields: state.listOfFields,
      ),
    );
  }

  Future<void> toggleShowOlderShifts({required bool newValue}) async {
    emit(
      // TODO(any): Handle filtering
      state.copyWith(
        showOlder: newValue,
      ),
    );
  }
}

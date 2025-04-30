import 'package:bloc/bloc.dart';
import 'package:foot_app/models/pitch.dart';
import 'package:foot_app/pages/shift_details/cubit/shift_details_state.dart';

class ShiftsDetailsCubit extends Cubit<ShiftsDetailsState> {
  ShiftsDetailsCubit()
      : super(
          ShiftsDetailsInitial(
            selectedDate: DateTime.now(),
          ),
        );

  Future<void> loadShiftsDetailsByDate(
    DateTime selectedDate,
    List<Field> listOfFields,
  ) async {
    emit(
      ShiftsDetailsInitial(
        selectedDate: selectedDate,
        listOfFields: listOfFields,
      ),
    );
    // TODO(any): Remove timer once have backend
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(
      ShiftsDetailsLoaded(
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

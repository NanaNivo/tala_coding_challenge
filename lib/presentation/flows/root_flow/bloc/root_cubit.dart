import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());

  void navigate(int index) {
    emit(RootState(currentIndex: index));
  }

  void setActivityDetails(bool isActivityDetails) {
    emit(RootState(currentIndex: state.currentIndex, isActivityDetails: isActivityDetails,));
  }
  void setNotification(Map notification)
  {
    emit(RootState(currentIndex: state.currentIndex, isActivityDetails: state.isActivityDetails, ));
  }
}

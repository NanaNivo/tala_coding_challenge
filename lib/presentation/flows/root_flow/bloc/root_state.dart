part of 'root_cubit.dart';

class RootState extends Equatable {
  const RootState({this.currentIndex = 0 , this.isActivityDetails = false});

  final int currentIndex;
  final bool isActivityDetails;


  @override
  List<Object> get props => [currentIndex,isActivityDetails];
}

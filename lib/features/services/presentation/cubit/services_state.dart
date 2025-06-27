part of 'services_cubit.dart';



abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final OfferEntity offers;

  const ServicesLoaded({required this.offers});

  @override
  List<Object> get props => [offers];
}

class ServicesError extends ServicesState {}

class ServicesUpdated extends ServicesState {
  final int timestamp;
  
  const ServicesUpdated({required this.timestamp});
  
  @override
  List<Object> get props => [timestamp];
}
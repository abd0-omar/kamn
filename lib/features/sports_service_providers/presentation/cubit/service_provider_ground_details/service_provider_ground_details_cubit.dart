import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_provider_ground_details_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_state.dart';

@injectable
class ServiceProviderGroundDetailsCubit
    extends Cubit<ServiceProviderGroundDetailsState> {
  ServiceProviderGroundDetailsCubit({required this.repository})
      : super(ServiceProviderGroundDetailsState(
            state: ServiceProviderGroundDetailsStatus.initial));

  ServiceProviderGroundDetailsRepository repository;

  TextEditingController commentController = TextEditingController();
  Future<void> accept(PlaygroundModel playground) async {
    var response = await repository.addToFirebase(playground);
    response.fold((error) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.failure,
          erorrMessage: error.erorr));
    }, (sucess) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.success,
          successMessage: 'this play ground accepted'));
    });
  }

  Future<void> decline(
      PlaygroundRequestModel playground, Map<String, dynamic> data) async {
    var response = await repository.updateState(playground, data);
    response.fold((error) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.failure,
          erorrMessage: error.erorr));
    }, (sucess) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.success,
          successMessage: 'this play ground decline'));
    });
  }
}
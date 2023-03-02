import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_model.dart';
import '../../data/models/login_request.dart';
import '../../domain/usecases/lets_login.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationRequestEvent>((event, emit) async {
      emit(RegistrationLoad());
      try {
        final data = await letsLogin.execute(89);
        emit(RegistrationDone(data));
      } catch (e) {
        emit(RegistrationError(e.toString()));
      }
    });
    on<AgreeEvent>((event, emit) async {
      emit(AgreeState(event.agree));
    });
  }
}

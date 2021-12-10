import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/auth/auth_cubit.dart';
import 'package:social_media_app/auth/auth_repository.dart';
import 'package:social_media_app/auth/confirm/confirmation_event.dart';
import 'package:social_media_app/auth/confirm/confirmation_state.dart';
import 'package:social_media_app/auth/form_submission_status.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ConfirmationBloc({
    required this.authRepo,
    required this.authCubit,
  }) : super(ConfirmationState());

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    // Confirmation code updated
    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(code: event.code);

      // Form submitted
    } else if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepo.confirmSignUp(
          username: authCubit.credentials.username, //dependency injection hanging on the state of our cubit
          confirmationCode: state.code,
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        final credentials = authCubit.credentials;//access credentials from authCubit
        credentials.userId = userId;//update userId

        authCubit.launchSession(credentials);
      } on Exception catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

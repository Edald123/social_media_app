abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}
//4 different states
class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  //hold exception in case we want to do something with it later
  final Exception exception;

  SubmissionFailed({required this.exception});
}

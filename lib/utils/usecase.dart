// ignore_for_file: one_member_abstracts

abstract class NonFutureUseCase<ReturnType, Params> {
  ReturnType execute(Params params);
}

abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> execute(Params params);
}

abstract class StreamUseCase<ReturnType, Params> {
  Stream<ReturnType> execute(Params params);
}

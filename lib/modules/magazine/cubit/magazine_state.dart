part of 'magazine_cubit.dart';

class MagazineState extends Equatable {
  const MagazineState({
        this.todaysMaagazines,
        this.magazines,
      this.count,
      this.next,
      this.previous,
      this.error,
      required this.isLoaded,
      required this.isLoading});

  final List<Magazine>? todaysMaagazines;
  final List<Magazine>? magazines;
  final NetworkExceptions? error;
  final int? count;
  final int? next;
  final int? previous;
  final bool isLoaded;
  final bool isLoading;

  @override
  List<Object?> get props => [todaysMaagazines, magazines, error, isLoaded, isLoading, count, next, previous];

  MagazineState copyWith(
      {List<Magazine>? todaysMaagazines,
      List<Magazine>? magazines,
      int? count,
      int? next,
      int? previous,
      NetworkExceptions? error,
      bool? isLoading,
      bool? isLoaded}) {
    return MagazineState(
        todaysMaagazines: todaysMaagazines ?? this.todaysMaagazines,
        magazines: magazines ?? this.magazines,
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        error: error ?? this.error,
        isLoaded: isLoaded ?? this.isLoaded,
        isLoading: isLoading ?? this.isLoading);
  }
}

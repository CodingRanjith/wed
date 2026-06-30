part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, noWedding, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.wedding,
    this.totalSpent = 0,
    this.totalPaid = 0,
    this.guestCount = 0,
    this.pendingTasks = 0,
    this.upcomingCeremony,
    this.latestExpense,
    this.todaysTasks = const [],
    this.errorMessage,
  });

  final HomeStatus status;
  final WeddingEntity? wedding;
  final double totalSpent;
  final double totalPaid;
  final int guestCount;
  final int pendingTasks;
  final CeremonyEntity? upcomingCeremony;
  final ExpenseEntity? latestExpense;
  final List<TimelineTaskEntity> todaysTasks;
  final String? errorMessage;

  HomeState copyWith({
    HomeStatus? status,
    WeddingEntity? wedding,
    double? totalSpent,
    double? totalPaid,
    int? guestCount,
    int? pendingTasks,
    CeremonyEntity? upcomingCeremony,
    ExpenseEntity? latestExpense,
    List<TimelineTaskEntity>? todaysTasks,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      wedding: wedding ?? this.wedding,
      totalSpent: totalSpent ?? this.totalSpent,
      totalPaid: totalPaid ?? this.totalPaid,
      guestCount: guestCount ?? this.guestCount,
      pendingTasks: pendingTasks ?? this.pendingTasks,
      upcomingCeremony: upcomingCeremony ?? this.upcomingCeremony,
      latestExpense: latestExpense ?? this.latestExpense,
      todaysTasks: todaysTasks ?? this.todaysTasks,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        wedding,
        totalSpent,
        totalPaid,
        guestCount,
        pendingTasks,
        upcomingCeremony,
        latestExpense,
        todaysTasks,
        errorMessage,
      ];
}

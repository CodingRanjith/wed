import 'package:get_it/get_it.dart';
import 'package:wedding_planner_india/core/services/backup_file_helper.dart';
import 'package:wedding_planner_india/core/services/backup_service.dart';
import 'package:wedding_planner_india/core/services/live_location_service.dart';
import 'package:wedding_planner_india/core/services/local_notification_service.dart';
import 'package:wedding_planner_india/core/services/route_service.dart';
import 'package:wedding_planner_india/data/database/app_database.dart';
import 'package:wedding_planner_india/data/datasources/local/local_datasources.dart';
import 'package:wedding_planner_india/domain/repositories/mahal_repository.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:wedding_planner_india/features/ceremonies/presentation/bloc/ceremony_bloc.dart';
import 'package:wedding_planner_india/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:wedding_planner_india/features/home/presentation/bloc/home_bloc.dart';
import 'package:wedding_planner_india/features/mahals/presentation/bloc/mahal_map_bloc.dart';
import 'package:wedding_planner_india/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:wedding_planner_india/features/planner/presentation/bloc/planner_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<AppDatabase>(AppDatabase.new);

  getIt.registerLazySingleton<WeddingLocalDataSource>(
    () => WeddingLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<CeremonyLocalDataSource>(
    () => CeremonyLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<BudgetLocalDataSource>(
    () => BudgetLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<GuestLocalDataSource>(
    () => GuestLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<TimelineLocalDataSource>(
    () => TimelineLocalDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton(() => WeddingRepository(getIt()));
  getIt.registerLazySingleton(() => CeremonyRepository(getIt()));
  getIt.registerLazySingleton(() => BudgetRepository(getIt()));
  getIt.registerLazySingleton(() => GuestRepository(getIt()));
  getIt.registerLazySingleton(() => TimelineRepository(getIt()));

  getIt.registerLazySingleton(MahalRepository.new);
  getIt.registerLazySingleton(RouteService.new);
  getIt.registerLazySingleton(LiveLocationService.new);
  getIt.registerFactory(
    () => MahalMapBloc(
      repository: getIt(),
      liveLocationService: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => BackupService(getIt()));
  getIt.registerLazySingleton(() => BackupFileHelper(getIt()));
  getIt.registerLazySingleton(LocalNotificationService.new);

  getIt.registerFactory(
    () => OnboardingBloc(
      weddingRepository: getIt(),
      ceremonyRepository: getIt(),
      budgetRepository: getIt(),
      timelineRepository: getIt(),
    ),
  );
  getIt.registerFactory(() => HomeBloc(
        weddingRepository: getIt(),
        budgetRepository: getIt(),
        guestRepository: getIt(),
        timelineRepository: getIt(),
        ceremonyRepository: getIt(),
      ));
  getIt.registerFactory(() => PlannerBloc(timelineRepository: getIt()));
  getIt.registerFactory(() => BudgetBloc(budgetRepository: getIt()));
  getIt.registerFactory(() => GuestBloc(guestRepository: getIt()));
  getIt.registerFactory(() => CeremonyBloc(ceremonyRepository: getIt()));
}

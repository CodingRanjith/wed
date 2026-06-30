import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/onboarding/presentation/bloc/onboarding_bloc.dart';

class MockWeddingRepository extends Mock implements WeddingRepository {}

class MockCeremonyRepository extends Mock implements CeremonyRepository {}

class MockBudgetRepository extends Mock implements BudgetRepository {}

class MockTimelineRepository extends Mock implements TimelineRepository {}

void main() {
  late MockWeddingRepository weddingRepository;
  late MockCeremonyRepository ceremonyRepository;
  late MockBudgetRepository budgetRepository;
  late MockTimelineRepository timelineRepository;
  late OnboardingBloc bloc;

  setUp(() {
    weddingRepository = MockWeddingRepository();
    ceremonyRepository = MockCeremonyRepository();
    budgetRepository = MockBudgetRepository();
    timelineRepository = MockTimelineRepository();
    bloc = OnboardingBloc(
      weddingRepository: weddingRepository,
      ceremonyRepository: ceremonyRepository,
      budgetRepository: budgetRepository,
      timelineRepository: timelineRepository,
    );
  });

  tearDown(() => bloc.close());

  test('initial state has default values', () {
    expect(bloc.state.currentStep, 0);
    expect(bloc.state.weddingType, WeddingType.tamilHindu);
    expect(bloc.state.budget, 700000);
  });

  blocTest<OnboardingBloc, OnboardingState>(
    'updates bride name',
    build: () => bloc,
    act: (b) => b.add(const OnboardingFieldUpdated(brideName: 'Priya')),
    expect: () => [
      const OnboardingState(brideName: 'Priya'),
    ],
  );

  blocTest<OnboardingBloc, OnboardingState>(
    'advances to next step',
    build: () => bloc,
    seed: () => const OnboardingState(brideName: 'Priya'),
    act: (b) => b.add(const OnboardingNextStep()),
    expect: () => [
      const OnboardingState(brideName: 'Priya', currentStep: 1),
    ],
  );
}

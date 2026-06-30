import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/wedding_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

const _uuid = Uuid();

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({
    required WeddingRepository weddingRepository,
    required CeremonyRepository ceremonyRepository,
    required BudgetRepository budgetRepository,
    required TimelineRepository timelineRepository,
  })  : _weddingRepository = weddingRepository,
        _ceremonyRepository = ceremonyRepository,
        _budgetRepository = budgetRepository,
        _timelineRepository = timelineRepository,
        super(const OnboardingState()) {
    on<OnboardingFieldUpdated>(_onFieldUpdated);
    on<OnboardingNextStep>(_onNextStep);
    on<OnboardingPreviousStep>(_onPreviousStep);
    on<OnboardingCompleted>(_onCompleted);
  }

  final WeddingRepository _weddingRepository;
  final CeremonyRepository _ceremonyRepository;
  final BudgetRepository _budgetRepository;
  final TimelineRepository _timelineRepository;

  void _onFieldUpdated(
    OnboardingFieldUpdated event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(
      brideName: event.brideName ?? state.brideName,
      groomName: event.groomName ?? state.groomName,
      weddingDate: event.weddingDate ?? state.weddingDate,
      location: event.location ?? state.location,
      weddingType: event.weddingType ?? state.weddingType,
      budget: event.budget ?? state.budget,
      guestCount: event.guestCount ?? state.guestCount,
      religion: event.religion ?? state.religion,
      tradition: event.tradition ?? state.tradition,
      currency: event.currency ?? state.currency,
    ));
  }

  void _onNextStep(OnboardingNextStep event, Emitter<OnboardingState> emit) {
    if (state.currentStep < OnboardingState.totalSteps - 1) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    OnboardingPreviousStep event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  Future<void> _onCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final weddingId = _uuid.v4();
      final wedding = WeddingEntity(
        id: weddingId,
        brideName: state.brideName,
        groomName: state.groomName,
        weddingDate: state.weddingDate!,
        location: state.location,
        weddingType: state.weddingType,
        budget: state.budget,
        guestCount: state.guestCount,
        religion: state.religion,
        tradition: state.tradition,
        currency: state.currency,
        createdAt: DateTime.now(),
      );

      await _weddingRepository.saveWedding(wedding);
      await _ceremonyRepository.seedCeremonies(weddingId, state.weddingType);
      await _budgetRepository.seedBudgetCategories(weddingId);
      await _timelineRepository.seedTimeline(weddingId);
      await _weddingRepository.setOnboardingComplete(true);

      emit(state.copyWith(isSubmitting: false, isComplete: true));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to create wedding. Please try again.',
      ));
    }
  }
}

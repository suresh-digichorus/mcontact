part of 'animation_bloc.dart';

abstract class AnimationState extends Equatable {}

class AnimationInitial extends AnimationState {
  @override
  List<Object?> get props => [];
}

class WidgetFadeAnimationState extends AnimationState {
  @override
  List<Object?> get props => [];
}

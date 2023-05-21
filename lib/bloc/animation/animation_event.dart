part of 'animation_bloc.dart';

abstract class AnimationEvent extends Equatable {}

class WidgetFadeAnimationEvent extends AnimationEvent {
  @override
  List<Object?> get props => [];
}

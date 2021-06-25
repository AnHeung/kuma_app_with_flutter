part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent extends Equatable{
  @override
  List<Object> get props => [];

  const NetworkEvent();
}

class NetworkConnect extends NetworkEvent{}

class NetworkDisconnect extends NetworkEvent{}

class CheckNetwork extends NetworkEvent{}
part of 'network_cubit.dart';

class NetworkState extends Equatable {
  const NetworkState({
    required this.isConnectionListening,
    required this.hasConnection,
  });
  final bool isConnectionListening;
  final bool hasConnection;

  NetworkState copyWith({
    bool? isConnectionListening,
    bool? hasConnection,
  }) {
    return NetworkState(
      isConnectionListening:
          isConnectionListening ?? this.isConnectionListening,
      hasConnection: hasConnection ?? this.hasConnection,
    );
  }

  @override
  List<Object> get props => [
        isConnectionListening,
        hasConnection,
      ];
}

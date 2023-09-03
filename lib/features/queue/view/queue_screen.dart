import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/game/view/game_screen.dart';
import 'package:fusion/features/home/view/view.dart';
import 'package:fusion/repositories/queue_repository/bloc/queue_bloc.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});
  static const String path = '/queue';
  static const String name = 'queue';

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> with WidgetsBindingObserver {
  late UserBloc userBloc;
  final List<Color> _colorList = [
    Colors.orange,
    Colors.orange.shade900,
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    context.read<UserBloc>().add(const WatchWithUidRequested());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      context.read<QueueBloc>().add(const LeaveQueueRequested());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    userBloc.add(const StopWatchingUserRequested());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = context.read<UserBloc>();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState.user?.gameId != null && mounted) {
          context.goNamed(GameScreen.name);
        }
        return BlocBuilder<QueueBloc, QueueState>(
          builder: (context, queueState) {
            if (queueState is QueueReadyToEnter) {
              if (userState.user!.gameId != null && mounted) {
                context.goNamed(GameScreen.name);
              } else {
                context.read<QueueBloc>().add(const EnterQueueRequested());
              }
            }
            if (queueState is QueueLeaved && mounted) {
              context.goNamed(HomeScreen.name);
            }

            return BaseScaffold(
              safeArea: true,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _backGroundImage(context),
                        _effect(),
                        const Animation(),
                      ],
                    ),
                  ),
                  BaseColumn(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(userState.user?.username ?? ''),
                      Padding(
                        padding: SharedPaddings.all32,
                        child: GradientTextButton(
                          'MATCH SEARCHING..',
                          style: GoogleFonts.bangers(fontSize: 36),
                        ),
                      ),
                      if (queueState is QueueHasData)
                        const Text('In Queue')
                      else if (queueState is QueueEmpty)
                        const Text('Get Ready'),
                      GradientButton(
                        text: 'Cancel',
                        onPressed: () {
                          if (queueState is QueueReadyToEnter && mounted) {
                            return context.goNamed(HomeScreen.name);
                          }
                          if (queueState is QueueHasData) {
                            return context
                                .read<QueueBloc>()
                                .add(const LeaveQueueRequested());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  Newton _effect() {
    return Newton(
      activeEffects: [
        PulseEffect(
          particleConfiguration: ParticleConfiguration(
            color: LinearInterpolationParticleColor(
              colors: _colorList,
            ),
            shape: CircleShape(),
            size: const Size(5, 5),
          ),
          effectConfiguration: const EffectConfiguration(
            particlesPerEmit: 15,
            emitDuration: 1000,
            minDistance: 200,
            minFadeOutThreshold: 2,
            maxFadeOutThreshold: 2,
          ),
        ),
      ],
    );
  }

  ColorFiltered _backGroundImage(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black,
        BlendMode.color,
      ),
      child: Image.asset(
        'assets/images/match_searching/back_ground.png',        
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Animation extends StatefulWidget {
  const Animation({
    super.key,
  });

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  late Timer _timer;
  int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print(_counter.toString().padLeft(2, '0'));
        _counter++;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset('assets/animations/animation_lm2okb4h.json'),
        Text(
          _counter.toString().padLeft(2,'0'),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

//bu widget sonra yapılacak.
class BackGrownd extends StatefulWidget {
  const BackGrownd({super.key});

  @override
  State<BackGrownd> createState() => _BackGrowndState();
}

class _BackGrowndState extends State<BackGrownd> {
  List<String> images = [
    'assets/images/air_cards/aero.png',
    'assets/images/air_cards/aria.png',
    'assets/images/air_cards/aurora.png',
    'assets/images/air_cards/orion.png',
    'assets/images/air_cards/zephyr.png',
    'assets/images/air_cards/zephyr.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Image.asset(images.first),
            );
          }),
    );
  }
}

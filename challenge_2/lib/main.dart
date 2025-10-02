import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag & Match Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DragMatchPage(title: 'Drag & Match Colors'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DragMatchPage extends StatefulWidget {
  const DragMatchPage({super.key, required this.title});

  final String title;

  @override
  State<DragMatchPage> createState() => _DragMatchPageState();
}

class _DragMatchPageState extends State<DragMatchPage> {
  final List<Color> palette = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  // Track which color has been correctly matched (locked in its target)
  final Set<Color> matchedColors = <Color>{};

  // Provide quick reset capability
  void _reset() {
    setState(() {
      matchedColors.clear();
    });
  }

  bool get allMatched =>
      matchedColors.length >= 3; // at least first 3 colors required

  @override
  Widget build(BuildContext context) {
    final List<Color> activeBalls = palette.take(3).toList();
    final List<Color> targets = palette.take(3).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _reset,
            tooltip: 'Reset',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          _buildInstructions(),
          const SizedBox(height: 16),
          _buildTargetsRow(targets),
          const Spacer(),
          _buildBallsRow(activeBalls),
          const SizedBox(height: 24),
          _buildSuccessBanner(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Drag each colored ball into its matching container. Incorrect drops snap back.',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBallsRow(List<Color> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map((Color color) {
        final bool isLocked = matchedColors.contains(color);
        return Draggable<Color>(
          data: color,
          maxSimultaneousDrags: isLocked ? 0 : 1,
          feedback: _Ball(color: color, elevation: 8, scale: 1.1),
          childWhenDragging: _Ball(color: color.withOpacity(0.3), dashed: true),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLocked ? 0.3 : 1,
            child: _Ball(color: color),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTargetsRow(List<Color> colors) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: colors.map((Color color) {
          final bool isMatchedHere = matchedColors.contains(color);
          return DragTarget<Color>(
            builder: (
              BuildContext context,
              List<Color?> candidateData,
              List<dynamic> rejects,
            ) {
              final bool isActive = candidateData.isNotEmpty;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: isMatchedHere ? color : color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isActive ? color : Colors.grey.shade400,
                    width: isActive ? 4 : 2,
                  ),
                  boxShadow: isActive
                      ? <BoxShadow>[
                          BoxShadow(
                            color: color.withOpacity(0.4),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ]
                      : const <BoxShadow>[],
                ),
                child: Center(
                  child: Icon(
                    isMatchedHere ? Icons.check_circle : Icons.inbox,
                    color: isMatchedHere ? color.darken(0.1) : Colors.black54,
                    size: 32,
                  ),
                ),
              );
            },
            onWillAcceptWithDetails: (DragTargetDetails<Color> details) {
              return details.data == color; // only highlight for correct color
            },
            onAcceptWithDetails: (DragTargetDetails<Color> details) {
              if (details.data == color) {
                setState(() {
                  matchedColors.add(color);
                });
              }
            },
            onLeave: (Color? data) {
              // Optional: could add haptic or sound here
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSuccessBanner() {
    if (!allMatched) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green.shade600, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.emoji_events, color: Colors.green),
            const SizedBox(width: 8),
            Text(
              'Great job! All \ncolors matched.',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.green.shade900),
            ),
            const SizedBox(width: 12),
            IconButton(onPressed: _reset, icon: const Icon(Icons.refresh)),
          ],
        ),
      ),
    );
  }
}

class _Ball extends StatelessWidget {
  const _Ball({
    required this.color,
    this.elevation = 2,
    this.scale = 1.0,
    this.dashed = false,
  });

  final Color color;
  final double elevation;
  final double scale;
  final bool dashed;

  @override
  Widget build(BuildContext context) {
    final Widget circle = Container(
      width: 64 * scale,
      height: 64 * scale,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dashed ? Colors.transparent : color,
        border: Border.all(color: color, width: 3),
      ),
    );

    return Material(
      color: Colors.transparent,
      elevation: elevation,
      shape: const CircleBorder(),
      child: circle,
    );
  }
}

extension _ColorUtils on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslDark = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return hslDark.toColor();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/camera_data.dart';
import 'camera_player.dart';
import 'login_screen.dart';
import '../serivce/update_checker.dart';
import 'package:flutter/foundation.dart';

// ============================================================================
// CUSTOM ZONE ORDER
// ============================================================================

const List<String> zoneOrder = [
  'AWP',
  'WIP',
  'MWH Assy',
  'Switch Assy',
  'Switch',
  '4 Wheeler',
  'ED Shop Floor',
  'SMT',
  'Through Hole',
  'Battery Charger',
  'Shop Floor',
  'Store',
  'Store MWH',
  'Store ED',
  'Office',
  'Dock Area',
  'Outer Periphery & Gates',
  'Office Ground Floor',
  'Office 1St Floor',
  'Maintenance',
  'Premises Outside',
  'Canteen',
  'Training Room',
  'Rework Areas',
  'Terrace',
  'Reception',
  'Lab',
  'IT / Server Room',
  'Switch',
  'Material Gate',
  'FG Area',
  'Parking',
  'Dispatch',
  'Gallery',
  'Scrap Yard',
  'Stairs',
  'Other Area',
];

// ============================================================================
// HOME SCREEN
// ============================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // ==========================================================================
  // SELECTION
  // ==========================================================================

  String? selectedPlant;
  String? selectedZone;

  bool _exitDialogShowing = false;

  AppLifecycleState? _lastLifecycleState;

  int _resumeGeneration = 0;

  // ==========================================================================
  // INIT
  // ==========================================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    debugPrint('CCTV HOME: HomeScreen initialized');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      if (!kIsWeb) {
        debugPrint('CCTV HOME: Calling UpdateChecker');

        await UpdateChecker.checkForUpdate(context);

        if (!mounted) return;

        debugPrint('CCTV HOME: UpdateChecker completed');
      } else {
        debugPrint('CCTV HOME: Web detected - UpdateChecker skipped');
      }
    });
  }

  // ==========================================================================
  // APP LIFECYCLE
  // ==========================================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    debugPrint('CCTV APP LIFECYCLE: $state');

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      debugPrint('CCTV APP: BACKGROUND');

      _lastLifecycleState = state;

      return;
    }

    if (state == AppLifecycleState.resumed) {
      debugPrint('CCTV APP: RESUMED');

      if (_lastLifecycleState == AppLifecycleState.paused ||
          _lastLifecycleState == AppLifecycleState.inactive) {
        _restartVisibleCameras();
      }

      _lastLifecycleState = AppLifecycleState.resumed;
    }
  }

  // ==========================================================================
  // RESTART CAMERAS AFTER RESUME
  // ==========================================================================

  void _restartVisibleCameras() {
    if (!mounted) return;

    debugPrint('CCTV: RESTARTING CAMERA PLAYERS');

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        _resumeGeneration++;
      });

      debugPrint(
        'CCTV: CAMERA RESTART GENERATION = '
        '$_resumeGeneration',
      );
    });
  }

  // ==========================================================================
  // DISPOSE
  // ==========================================================================

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // ==========================================================================
  // PLANTS
  // ==========================================================================

  List<String> get plants {
    return cameraList.map((camera) => camera.plant).toSet().toList();
  }

  // ==========================================================================
  // ZONES FOR SELECTED PLANT
  // ==========================================================================

  List<String> get zonesForSelectedPlant {
    if (selectedPlant == null) {
      return [];
    }

    final availableZones = cameraList
        .where((camera) => camera.plant == selectedPlant)
        .map((camera) => camera.zone)
        .toSet();

    final sortedZones = zoneOrder
        .where((zone) => availableZones.contains(zone))
        .toList();

    final customZones = availableZones
        .where((zone) => !zoneOrder.contains(zone))
        .toList();

    return [...sortedZones, ...customZones];
  }

  // ==========================================================================
  // CAMERAS FOR SELECTED PLANT + ZONE
  // ==========================================================================

  List<CameraData> get camerasForSelectedZone {
    if (selectedPlant == null || selectedZone == null) {
      return [];
    }

    return cameraList
        .where(
          (camera) =>
              camera.plant == selectedPlant && camera.zone == selectedZone,
        )
        .toList();
  }

  // ==========================================================================
  // PLANT CHANGE
  // ==========================================================================

  void onPlantChanged(String? plant) {
    if (!mounted) return;

    CameraPlayer.stopAllPlayers().catchError((error) {
      debugPrint(
        'PLANT CHANGE: Camera cleanup error: '
        '$error',
      );
    });

    setState(() {
      selectedPlant = plant;
      selectedZone = null;
      _resumeGeneration++;
    });

    debugPrint('CCTV: SELECTED PLANT = $selectedPlant');

    debugPrint('CCTV: ZONE RESET');
  }

  // ==========================================================================
  // ZONE CHANGE
  // ==========================================================================

  void onZoneChanged(String? zone) {
    if (!mounted) return;

    CameraPlayer.stopAllPlayers().catchError((error) {
      debugPrint(
        'ZONE CHANGE: Camera cleanup error: '
        '$error',
      );
    });

    setState(() {
      selectedZone = zone;
      _resumeGeneration++;
    });

    debugPrint('CCTV: SELECTED PLANT = $selectedPlant');

    debugPrint('CCTV: SELECTED ZONE = $selectedZone');
  }

  // ==========================================================================
  // FULL SCREEN CAMERA
  // ==========================================================================

  void openFullScreen(CameraData camera) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FullScreenCamera(camera: camera)),
    );
  }

  // ==========================================================================
  // EXIT DIALOG
  // ==========================================================================

  Future<bool> _showExitDialog() async {
    if (_exitDialogShowing) {
      return false;
    }

    _exitDialogShowing = true;

    try {
      final shouldExit = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text(
              'Exit CCTV Monitor?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(false);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(true);
                },
                child: const Text('Exit'),
              ),
            ],
          );
        },
      );

      return shouldExit == true;
    } finally {
      _exitDialogShowing = false;
    }
  }

  // ==========================================================================
  // ANDROID BACK
  // ==========================================================================

  Future<void> _handleBackPress() async {
    if (!mounted) return;

    if (Theme.of(context).platform != TargetPlatform.android) {
      return;
    }

    final shouldExit = await _showExitDialog();

    if (!shouldExit || !mounted) {
      return;
    }

    try {
      CameraPlayer.stopAllPlayers().catchError((error) {
        debugPrint(
          'BACK: Camera cleanup error: '
          '$error',
        );
      });
    } catch (e) {
      debugPrint(
        'BACK: Camera cleanup exception: '
        '$e',
      );
    }

    await SystemNavigator.pop();
  }

  // ==========================================================================
  // LOGOUT
  // ==========================================================================

  Future<void> _logout() async {
    if (!mounted) return;

    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (shouldLogout != true) {
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.clear();

      debugPrint('LOGOUT: SharedPreferences cleared');
    } catch (e) {
      debugPrint('LOGOUT: Session clear error: $e');
    }

    if (!mounted) return;

    try {
      CameraPlayer.stopAllPlayers().catchError((error) {
        debugPrint(
          'LOGOUT: Camera cleanup error: '
          '$error',
        );
      });
    } catch (e) {
      debugPrint(
        'LOGOUT: Camera cleanup exception: '
        '$e',
      );
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  // ==========================================================================
  // RESPONSIVE WEB GRID
  // ==========================================================================

  Widget _buildWebCameraGrid(List<CameraData> cameras) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        int crossAxisCount;

        // --------------------------------------------------------------
        // WEB BREAKPOINTS
        //
        // 1200+  => 4 cameras
        // 900+   => 3 cameras
        // 600+   => 2 cameras
        // <600   => 1 camera
        // --------------------------------------------------------------

        if (width >= 1200) {
          crossAxisCount = 4;
        } else if (width >= 900) {
          crossAxisCount = 3;
        } else if (width >= 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        // --------------------------------------------------------------
        // CARD WIDTH
        //
        // Available width ke according calculate hoti hai.
        // Card ko unnecessarily bahut narrow nahi hone dete.
        // --------------------------------------------------------------

        const horizontalPadding = 24.0;
        const gap = 10.0;

        final availableWidth =
            width - horizontalPadding - ((crossAxisCount - 1) * gap);

        final cardWidth = availableWidth / crossAxisCount;

        debugPrint(
          'CCTV WEB GRID | '
          'Width=$width | '
          'Columns=$crossAxisCount | '
          'CardWidth=$cardWidth',
        );

        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 20),

          cacheExtent: 500,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,

            crossAxisSpacing: gap,

            mainAxisSpacing: gap,

            // Header + video + footer ka
            // balanced card ratio.
            childAspectRatio: 16 / 10,
          ),

          itemCount: cameras.length,

          itemBuilder: (context, index) {
            final camera = cameras[index];

            return _LazyCameraCard(
              key: ValueKey(
                '${camera.rtspUrl}_'
                '$_resumeGeneration',
              ),
              camera: camera,
              isWeb: true,
              onFullScreen: () {
                openFullScreen(camera);
              },
            );
          },
        );
      },
    );
  }

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    final cameras = camerasForSelectedZone;

    final bool isAndroid = Theme.of(context).platform == TargetPlatform.android;

    return PopScope(
      canPop: !isAndroid,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          return;
        }

        if (isAndroid) {
          _handleBackPress();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F8),

        // ====================================================================
        // APP BAR
        // ====================================================================
        appBar: AppBar(
          title: const Text(
            'CCTV Monitor',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF0057B8),
          foregroundColor: Colors.white,

          leading: isAndroid
              ? IconButton(
                  tooltip: 'Back',
                  onPressed: _handleBackPress,
                  icon: const Icon(Icons.arrow_back),
                )
              : null,

          actions: [
            IconButton(
              tooltip: 'Logout',
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),

        // ====================================================================
        // BODY
        // ====================================================================
        body: SafeArea(
          child: Column(
            children: [
              // ==================================================================
              // DROPDOWNS
              // ==================================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Plant',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedPlant,
                      isExpanded: true,

                      decoration: InputDecoration(
                        hintText: 'Select Plant',
                        prefixIcon: const Icon(Icons.factory),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      items: plants.map((plant) {
                        return DropdownMenuItem<String>(
                          value: plant,
                          child: Text(plant, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),

                      onChanged: onPlantChanged,
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Select Zone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedZone,
                      isExpanded: true,

                      decoration: InputDecoration(
                        hintText: selectedPlant == null
                            ? 'Select Plant first'
                            : 'Select Zone',
                        prefixIcon: const Icon(Icons.location_on),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      items: zonesForSelectedPlant.map((zone) {
                        return DropdownMenuItem<String>(
                          value: zone,
                          child: Text(zone, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),

                      onChanged: selectedPlant == null ? null : onZoneChanged,
                    ),
                  ],
                ),
              ),

              // ==================================================================
              // CAMERA LIST / WEB GRID
              // ==================================================================
              Expanded(
                child: selectedPlant == null
                    ? _emptyState(Icons.factory, 'Select a plant to view zones')
                    : selectedZone == null
                    ? _emptyState(
                        Icons.location_on,
                        'Select a zone to view cameras',
                      )
                    : cameras.isEmpty
                    ? _emptyState(
                        Icons.videocam_off,
                        'No cameras found for this zone',
                      )
                    : kIsWeb
                    ? _buildWebCameraGrid(cameras)
                    :
                      // ====================================================
                      // MOBILE
                      // ====================================================
                      ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),

                        cacheExtent: 50,

                        itemCount: cameras.length,

                        // 12px vertical gap
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },

                        itemBuilder: (context, index) {
                          final camera = cameras[index];

                          return _LazyCameraCard(
                            key: ValueKey(
                              '${camera.rtspUrl}_'
                              '$_resumeGeneration',
                            ),
                            camera: camera,
                            isWeb: false,
                            onFullScreen: () {
                              openFullScreen(camera);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // EMPTY STATE
  // ==========================================================================

  Widget _emptyState(IconData icon, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.blueGrey.shade300),

          const SizedBox(height: 14),

          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey.shade600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// LAZY CAMERA CARD
// ============================================================================

class _LazyCameraCard extends StatefulWidget {
  final CameraData camera;

  final VoidCallback onFullScreen;

  final bool isWeb;

  const _LazyCameraCard({
    super.key,
    required this.camera,
    required this.onFullScreen,
    required this.isWeb,
  });

  @override
  State<_LazyCameraCard> createState() => _LazyCameraCardState();
}

class _LazyCameraCardState extends State<_LazyCameraCard> {
  bool _shouldStartPlayer = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {
        _shouldStartPlayer = true;
      });
    });
  }

  // ==========================================================================
  // VIDEO WIDGET
  // ==========================================================================

  Widget _buildVideo() {
    if (_shouldStartPlayer) {
      return CameraPlayer(
        key: ValueKey(widget.camera.rtspUrl),
        rtspUrl: widget.camera.rtspUrl,
        mediaMtxPath: widget.camera.mediaMtxPath,
      );
    }

    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Waiting...',
          style: TextStyle(color: Colors.white54, fontSize: 13),
        ),
      ),
    );
  }

  // ==========================================================================
  // BUILD CARD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

      child: InkWell(
        onTap: widget.onFullScreen,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ==================================================================
            // CAMERA HEADER
            // ==================================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),

              child: Row(
                children: [
                  const Icon(Icons.videocam, size: 19),

                  const SizedBox(width: 7),

                  Expanded(
                    child: Text(
                      widget.camera.cameraName,

                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  _PortBadge(port: widget.camera.port),
                ],
              ),
            ),

            // ==================================================================
            // VIDEO
            // ==================================================================

            // WEB:
            // GridView tile ki height
            // bounded hoti hai.
            //
            // Isliye Expanded safe hai.
            //
            // MOBILE:
            // ListView ke andar height
            // unbounded hoti hai.
            //
            // Isliye AspectRatio use
            // kar rahe hain.
            if (widget.isWeb)
              Expanded(child: _buildVideo())
            else
              AspectRatio(aspectRatio: 16 / 9, child: _buildVideo()),

            // ==================================================================
            // FULL SCREEN FOOTER
            // ==================================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Icon(
                    Icons.fullscreen,
                    size: 18,
                    color: Colors.blueGrey.shade600,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    'Tap for full screen',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.blueGrey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// PORT BADGE
// ============================================================================

class _PortBadge extends StatelessWidget {
  final String port;

  const _PortBadge({required this.port});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(7),
      ),

      child: Text(
        port,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ============================================================================
// FULL SCREEN CAMERA
// ============================================================================

class FullScreenCamera extends StatefulWidget {
  final CameraData camera;

  const FullScreenCamera({super.key, required this.camera});

  @override
  State<FullScreenCamera> createState() => _FullScreenCameraState();
}

class _FullScreenCameraState extends State<FullScreenCamera> {
  bool _isLandscape = true;

  @override
  void initState() {
    super.initState();

    _openLandscape();
  }

  // ==========================================================================
  // LANDSCAPE
  // ==========================================================================

  Future<void> _openLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    if (!mounted) return;

    setState(() {
      _isLandscape = true;
    });
  }

  // ==========================================================================
  // PORTRAIT
  // ==========================================================================

  Future<void> _openPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (!mounted) return;

    setState(() {
      _isLandscape = false;
    });
  }

  // ==========================================================================
  // TOGGLE ORIENTATION
  // ==========================================================================

  Future<void> _toggleOrientation() async {
    if (_isLandscape) {
      await _openPortrait();
    } else {
      await _openLandscape();
    }
  }

  // ==========================================================================
  // BACK
  // ==========================================================================

  Future<void> _goBack() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (!mounted) return;

    Navigator.pop(context);
  }

  // ==========================================================================
  // DISPOSE
  // ==========================================================================

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;

        _goBack();
      },

      child: Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(
          child: Column(
            children: [
              // ==================================================================
              // HEADER
              // ==================================================================
              Container(
                height: 56,
                color: Colors.black,

                child: Row(
                  children: [
                    IconButton(
                      onPressed: _goBack,

                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),

                    Expanded(
                      child: Text(
                        widget.camera.cameraName,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 8),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,

                        borderRadius: BorderRadius.circular(7),
                      ),

                      child: Text(
                        widget.camera.port,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: _toggleOrientation,

                      tooltip: _isLandscape ? 'Portrait' : 'Landscape',

                      icon: Icon(
                        _isLandscape ? Icons.fullscreen_exit : Icons.fullscreen,

                        color: Colors.white,

                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================================
              // VIDEO
              // ==================================================================
              Expanded(
                child: SizedBox.expand(
                  child: CameraPlayer(
                    key: ValueKey(widget.camera.rtspUrl),
                    rtspUrl: widget.camera.rtspUrl,
                    mediaMtxPath: widget.camera.mediaMtxPath,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraData {
  final String plant;
  final String zone;
  final String cameraName;
  final String rtspUrl;
  final String port;
  final String? mediaMtxPath;

  const CameraData({
    required this.plant,
    required this.zone,
    required this.cameraName,
    required this.rtspUrl,
    required this.port,
    this.mediaMtxPath,
  });
}

const List<CameraData> cameraList = [
  // ============================================================
  // HARIDWAR
  // ============================================================

  // =========================
  // AWP
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'WIP Old',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=17&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-awp-wip-old',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'CAM 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=2&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-awp-cam-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'Channel29',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=29&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-awp-channel-29',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'AWP-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=30&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-awp-awp-3',
  ),

  // =========================
  // WIP
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Lift Opposite',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1901',
    port: '43',
    mediaMtxPath: 'haridwar-wip-wip-lift-opposite',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Near REML Line',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2201',
    port: '43',
    mediaMtxPath: 'haridwar-wip-wip-near-reml-line',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'Locker Room 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=5&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-wip-locker-room-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'Locker Room 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=6&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-wip-locker-room-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'CAM 7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=7&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-wip-cam-7',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'CAM 11',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=11&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-wip-cam-11',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Area New',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=17&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-wip-wip-area-new',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=25&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-wip-wip-area',
  ),

  // =========================
  // MWH ASSY
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'PDI Conv 5',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/601',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-pdi-conv-5',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 5',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/701',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-5',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/801',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-7-et',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 1 Wire Assembly',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/901',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-1-wire-assembly',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 1',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1001',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 3 BOP Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1101',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-3-bop-side',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET Test',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1701',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-7-et-test',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Drinking Water Tr Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/3001',
    port: '43',
    mediaMtxPath: 'haridwar-mwh-assy-drinking-water-tr-side',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Wire Assembly Conveyor-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=1&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-wire-assembly-conveyor-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv-7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=12&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-7',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=13&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conveyor-no-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Maintenance Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=14&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-maintenance-gallery',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=16&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conveyor-no-5',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'ET Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=18&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-et-conveyor-no-4',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Gogoro Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=19&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-gogoro-line',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Offline First-Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=20&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-offline-first-floor',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Offline MWH',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=23&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-offline-mwh',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=26&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conv-6',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'REML-Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=28&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-reml-line',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=31&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conveyor-no-4',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=4&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-mwh-assy-cam-4',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=5&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-mwh-assy-cam-5',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 8',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=8&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-mwh-assy-cam-8',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 9',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=9&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-mwh-assy-cam-9',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 12',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=12&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-mwh-assy-cam-12',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=12&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-mwh-assy-mwh-conveyor-6',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'PDI Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=19&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-mwh-assy-pdi-area',
  ),

  // =========================
  // SWITCH ASSY
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Switch Scrap Area',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2501',
    port: '43',
    mediaMtxPath: 'haridwar-switch-assy-switch-scrap-area',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Old Switch Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=21&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-switch-assy-old-switch-gallery',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Switch Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=28&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-switch-assy-switch-area',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Material Lift',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=31&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-switch-assy-material-lift',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Switch Padprinting',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=32&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-switch-assy-switch-padprinting',
  ),

  // =========================
  // ED SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Testing',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/301',
    port: '43',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-testing-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Testing-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2001',
    port: '43',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-testing-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Final',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2101',
    port: '43',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-final',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED USB Quality Desk',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=30&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-usb-quality-desk',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Testing',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=32&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-testing-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Corridor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=3&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-corridor',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=4&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-smt-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=5&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-smt-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Throughhole-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=6&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-throughhole-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=7&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-smt-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Through-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=8&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-through-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Edtesting-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=11&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-edtesting-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Operator Att M/C',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=13&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-ed-shop-floor-ed-operator-att-mc',
  ),

  // =========================
  // STORE MWH
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'Store Hydrolic Lifter',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/101',
    port: '43',
    mediaMtxPath: 'haridwar-store-mwh-store-hydrolic-lifter',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'Store',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/201',
    port: '43',
    mediaMtxPath: 'haridwar-store-mwh-store',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=15&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-store-mwh-fg-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=16&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-store-mwh-fg-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG Packing-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=18&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-store-mwh-fg-packing-1',
  ),

  // =========================
  // STORE ED
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Store ED',
    cameraName: 'Pcb ED Store',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2601',
    port: '43',
    mediaMtxPath: 'haridwar-store-ed-pcb-ed-store',
  ),

  // =========================
  // DOCK AREA
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Store Unloading',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/401',
    port: '43',
    mediaMtxPath: 'haridwar-dock-area-store-unloading',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock',
    cameraName: 'Material Unloading-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2301',
    port: '43',
    mediaMtxPath: 'haridwar-dock-material-unloading-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Dispatch Loading',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2901',
    port: '43',
    mediaMtxPath: 'haridwar-dock-area-dispatch-loading',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Dispatch Bin Storage',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=2&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-dock-area-dispatch-bin-storage',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'BOP Scrap Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=29&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-dock-area-bop-scrap-area',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock',
    cameraName: 'Out Source Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=14&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-dock-out-source-loading',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'FG Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=21&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-dock-area-fg-loading',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=27&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-dock-area-material-gate',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'LPG Storage Parking',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1801',
    port: '43',
    mediaMtxPath: 'haridwar-outer-periphery-gates-lpg-storage-parking',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2701',
    port: '43',
    mediaMtxPath: 'haridwar-outer-periphery-gates-material-gate',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Parking North Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2801',
    port: '43',
    mediaMtxPath: 'haridwar-outer-periphery-gates-parking-north-side',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Entry Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=7&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-outer-periphery-gates-entry-gate',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DG Area 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=9&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-outer-periphery-gates-dg-area-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DG Area 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=10&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-outer-periphery-gates-dg-area-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Maingate Entrance North',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=25&subtype=1',
    port: '42',
    mediaMtxPath: 'haridwar-outer-periphery-gates-maingate-entrance-north',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'CAM 10',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=10&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-outer-periphery-gates-cam-10',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Park/Diesel Yard',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=1&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-outer-periphery-gates-park-diesel-yard',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Maingate Security',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=22&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-outer-periphery-gates-maingate-security',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=24&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-outer-periphery-gates-scrap-yard-2',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=26&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-outer-periphery-gates-scrap-yard-1',
  ),

  // =========================
  // OFFICE GROUND FLOOR
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Plant Head Sir Office',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=3&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-ground-floor-plant-head-sir-office',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Temple Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=8&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-ground-floor-temple-area',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'AWP Entrance Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=15&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-ground-floor-awp-entrance-gate',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'IT/HR Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=24&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-ground-floor-it-hr-gallery',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Lift Panel',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=27&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-ground-floor-lift-panel',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'CAM 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=1&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-office-ground-floor-cam-1',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Reception',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=2&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-office-ground-floor-reception',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Auditorium Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=10&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-office-ground-floor-auditorium-gallery',
  ),

  // =========================
  // OFFICE 1ST FLOOR
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'MD Room Coridoor',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2401',
    port: '43',
    mediaMtxPath: 'haridwar-office-1st-floor-md-room-coridoor',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'ED Office',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=4&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-office-1st-floor-ed-office',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'CAM 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=3&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-office-1st-floor-cam-3',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'CAM 6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=6&subtype=0',
    port: '44',
    mediaMtxPath: 'haridwar-office-1st-floor-cam-6',
  ),

  // =========================
  // MAINTENANCE
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Maintenance',
    cameraName: 'Panel Room Utility',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1201',
    port: '43',
    mediaMtxPath: 'haridwar-maintenance-panel-room-utility',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Maintenance',
    cameraName: 'Transformer East Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1301',
    port: '43',
    mediaMtxPath: 'haridwar-maintenance-transformer-east-side',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Maintenance',
    cameraName: 'Chiller Room',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=11&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-maintenance-chiller-room',
  ),

  // =========================
  // PREMISES OUTSIDE
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Premises Outside',
    cameraName: 'Channel20',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=20&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-premises-outside-channel-20',
  ),

  // =========================
  // CANTEEN
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Canteen',
    cameraName: 'Canteen',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/501',
    port: '43',
    mediaMtxPath: 'haridwar-canteen-canteen',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Canteen',
    cameraName: 'Canteen Punching M/C Counter',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1401',
    port: '43',
    mediaMtxPath: 'haridwar-canteen-canteen-punching-mc-counter',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Canteen',
    cameraName: 'Canteen-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=9&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-canteen-canteen-2',
  ),

  // =========================
  // TRAINING ROOM
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Training Room',
    cameraName: 'Lift & Training Room',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1501',
    port: '43',
    mediaMtxPath: 'haridwar-training-room-lift-training-room',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Training Room',
    cameraName: 'TTC First Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=22&subtype=0',
    port: '42',
    mediaMtxPath: 'haridwar-training-room-ttc-first-floor',
  ),

  // =========================
  // REWORK AREAS
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Rework Areas',
    cameraName: 'Outsource Rework',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1601',
    port: '43',
    mediaMtxPath: 'haridwar-rework-areas-outsource-rework',
  ),

  // =========================
  // TERRACE
  // =========================
  CameraData(
    plant: 'Haridwar',
    zone: 'Terrace',
    cameraName: 'Solder M/C Roof',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=23&subtype=0',
    port: '45',
    mediaMtxPath: 'haridwar-terrace-solder-mc-roof',
  ),

  // ============================================================
  // SEC - 8 MANESAR
  // ============================================================

  // ============================================================
  // NVR 115.112.58.125
  // ============================================================

  // =========================
  // TERRACE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Terrace',
    cameraName: 'TERRACE DROSS MC',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/101',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-terrace-dross-mc',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Terrace',
    cameraName: 'TERRACE WATER TANK',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/201',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-terrace-water-tank',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'MAIN GATE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/301',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-main-gate',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'RECPTION TEMPLE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/401',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-reception-temple',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'BOUNDRY DG SIDE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/501',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-boundary-dg-side',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'OUTSIDE PARKING',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/601',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-outside-parking',
  ),

  // =========================
  // LAB
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Lab',
    cameraName: 'ENV LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/701',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-env-lab',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'RECEPTION PANTRY',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/801',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-reception-pantry',
  ),

  // =========================
  // STORE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Store',
    cameraName: 'BASEMENT HONDA STORE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/901',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-basement-honda-store',
  ),

  // =========================
  // CANTEEN
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Canteen',
    cameraName: 'CANTEEN2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1001',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-canteen-2',
  ),

  // =========================
  // MAINTENANCE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Maintenance',
    cameraName: 'AIR COMPRESSOR AREA',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1101',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-air-compressor-area',
  ),

  // =========================
  // R&D
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Training Room',
    cameraName: 'R&D PERFORMANCE LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1201',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-rd-performance-lab',
  ),

  // =========================
  // IT / SERVER ROOM
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'IT / Server Room',
    cameraName: 'SERVER ROOM BSMNT',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1301',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-server-room-bsmnt',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'QUALITY OFFICE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1401',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-quality-office',
  ),

  // =========================
  // IT / SERVER ROOM
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'IT / Server Room',
    cameraName: 'SERVER ROOM 2ND FLOOR',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1501',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-server-room-2nd-floor',
  ),

  // =========================
  // CANTEEN
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Canteen',
    cameraName: 'CANTEEN 2ND FLOOR',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1601',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-canteen-2nd-floor',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'DESIGN OFFICE 2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1701',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-design-office-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'DESIGN OFFICE 1',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1801',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-design-office-1',
  ),

  // =========================
  // ED SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'ELECTRONICS DESIGN 2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1901',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-electronics-design-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'VALEO LINE 2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2001',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-valeo-line-2',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'EMBEDDED LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2101',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-embedded-lab',
  ),

  // =========================
  // STORE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Store',
    cameraName: 'STORE GALLERY',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2201',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-store-gallery',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'ELECTRONICS DIVISION',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2301',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-electronics-division',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2401',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-valeo-j4u',
  ),

  // =========================
  // R&D
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'EMBEDDED 2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2501',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-embedded-2',
  ),

  // =========================
  // CANTEEN
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: '2ND FLOOR PANTRY',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2601',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-2nd-floor-pantry',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'CORRIDOR ELECTRONICS LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2701',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-corridor-electronics-lab',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo FG Stroage',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2801',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-valeo-fg-storage',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'SCRAP YARD',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2901',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-scrap-yard',
  ),

  // =========================
  // TERRACE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Terrace',
    cameraName: 'TERRACE COIL COOLER',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/3001',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-terrace-coil-cooler',
  ),

  // =========================
  // CAMERA #32 - MAIN GATE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'MAIN GATE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/3201',
    port: '125',
    mediaMtxPath: 'sec8-manesar-125-main-gate-32',
  ),

  // ============================================================
  // NVR 115.112.58.126
  // ============================================================

  // =========================
  // MAINTENANCE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Maintenance',
    cameraName: 'BASEMENT GANGWAY UTILITY',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/101',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-basement-gangway-utility',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'ED TESTING AREA',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/201',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-ed-testing-area',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'MATERIAL LIFT 1ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/301',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-material-lift-1st-fl',
  ),

  // =========================
  // SMT
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT PASSAGE 1ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/401',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-smt-passage-1st-fl',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'FIRST FLR HR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/501',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-first-flr-hr',
  ),

  // =========================
  // TRAINING ROOM
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Training Room',
    cameraName: 'DOJO ROOM',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/601',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-dojo-room',
  ),

  // =========================
  // THROUGH HOLE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL 2',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/701',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-th-1st-fl-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL EFI',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/801',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-th-1st-fl-efi-1',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL EFI',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/901',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-th-1st-fl-efi-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL WAVE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1001',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-th-1st-fl-wave',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'PASSAGE T/H 1ST WATER COOLER',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1101',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-passage-th-1st-water-cooler',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'PASSAGE MAIN ENTRY',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1201',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-passage-main-entry',
  ),

  // =========================
  // SMT
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 2',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1301',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-smt-line-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 3',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1401',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-smt-line-3',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 4',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1501',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-smt-line-4',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 1',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1601',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-smt-line-1',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'CLUSTER AREA 1 ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1701',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-cluster-area-1st-fl',
  ),

  // =========================
  // OFFICE 1ST FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'RECEPTION AREA 1 ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1801',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-reception-area-1st-fl',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'CLUSTER AREA 1 ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1901',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-cluster-area-1st-fl',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'NEW LAB PASSAGE 2ND FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2001',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-new-lab-passage-2nd-fl',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DISPETCH SIDE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2101',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-dispatch-side',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'TRANSMISSION LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2201',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-transmission-lab-2nd-floor',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'PASSAGE 2ND FL LAB',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2301',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-passage-2nd-fl-lab',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'EMC LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2401',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-emc-lab-2nd-floor',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'HONDA LINE 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2501',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-honda-line-2nd-floor',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: '1ST FLOOR MAIN ENTRY',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2601',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-1st-floor-main-entry',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: '2ND FLOOR VALEO LINE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2701',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-2nd-floor-valeo-line',
  ),

  // =========================
  // NEW AREA
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'Camera 28',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2801',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-camera-28',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'RIG LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2901',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-rig-lab-2nd-floor',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'PASSAGE AREA 2ND FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/3001',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-passage-area-2nd-fl',
  ),

  // =========================
  // SHOP FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'MOLDING AREA',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/3101',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-molding-area',
  ),

  // =========================
  // OFFICE 1ST FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: '1ST FLOOR OFFICE 2',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/3201',
    port: '126',
    mediaMtxPath: 'sec8-manesar-126-1st-floor-office-2',
  ),

  // ============================================================
  // NVR 115.112.58.127
  // TOTAL CAMERAS: 28
  // ============================================================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 1',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/101',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-1',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 2',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/201',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 3',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/301',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-3',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger & BCM Line',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/401',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-bcm-line',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 5',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/501',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-5',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 6',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/601',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-6',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 7',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/701',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-7',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/801',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-valeo-j4u-1',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/901',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-valeo-j4u-2',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1001',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-valeo-j4u-3',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1101',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-valeo-j4u-4',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 12',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1201',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-12',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 13',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1301',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-13',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Dock Area',
    cameraName: 'Camera 14',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1401',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-14',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 15',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1501',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-15',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 16',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1601',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-16',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Store',
    cameraName: 'Camera 17',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1701',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-17',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 18',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1801',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-18',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'TH 19',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1901',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-th-19',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 20',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2001',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-20',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 21',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2101',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-21',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 22',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2201',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-22',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 23',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2301',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-23',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrape Area',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2401',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-scrape-area',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 25',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2501',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-25',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 26',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2601',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-26',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 27',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2701',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-battery-charger-27',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 28',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2801',
    port: '127',
    mediaMtxPath: 'sec8-manesar-127-camera-28',
  ),

  // ============================================================
  // BHIWADI
  // ============================================================

  // =========================
  // SWITCH
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch Store',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/101',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch101-switch-store',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/301',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch301-switch-domino-area',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch AAFF Line',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/401',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch401-switch-aaff-line',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch Line',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/501',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch501-switch-ather-line',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch WIP Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/601',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch601-switch-wip-area',
  ),

  // =========================
  // OFFICE
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Office',
    cameraName: 'SWITCH Office',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/201',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch201-switch-line',
  ),

  // =========================
  // MWH Assy
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'MWH Assy',
    cameraName: 'Converyer 01',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/701',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch701-1st-floor-01',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'MWH Assy',
    cameraName: '4-Wheeler',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1201',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1201-4-wheeler',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'MWH Assy',
    cameraName: '1st floor-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1401',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1401-1st-floor-02',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'MWH Assy',
    cameraName: '1st floor-03',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1501',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1501-1st-floor-03',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'MWH Assy',
    cameraName: '1st floor-04',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1701',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1701-1st-floor-04',
  ),

  // =========================
  // TERRACE
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Terrace',
    cameraName: 'ROOFTOP-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/801',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch801-rooftop-02',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Terrace',
    cameraName: 'FG Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1001',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1001-fg-area',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/901',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch901-material-gate',
  ),
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'COMPRESSOR AREA',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2501',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2501-compressor-area',
  ),
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Back Side Gallery',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1801',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1801-back-side-gallery',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2101',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2101-scrap-yard',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Main Gate Enterance',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2201',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2201-main-gate-enterance',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'FRONT GATE',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2301',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2301-front-gate',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Front Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2401',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2401-front-area',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Gate No-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2601',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2601-gate-no-02',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Main Gate',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2801',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2801-terrace',
  ),

  // =========================
  // WIP
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'WIP',
    cameraName: '1st Floor WIP Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1101',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1101-1st-floor-wip-area',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'WIP',
    cameraName: 'WIP MC Ground',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2001',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2001-wip-mc-ground',
  ),

  // =========================
  // 4-WHEELER
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: '4 Wheeler',
    cameraName: '4-WHEELER',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1301',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1301-4-wheeler',
  ),

  // =========================
  // DOCK AREA
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Dock Area',
    cameraName: 'Despatch Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1601',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1601-despatch-area',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Dock Area',
    cameraName: 'Material Inward',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2701',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2701-stairs-1st-floor',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Dock Area',
    cameraName: 'GF DESPATCH',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/3101',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch3101-gf-despatch',
  ),

  // =========================
  // AWP
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'AWP',
    cameraName: 'AWP Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1901',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch1901-awp-area',
  ),

  // =========================
  // CANTEEN
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Canteen',
    cameraName: 'Canteen',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2901',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch2901-canteen',
  ),

  // =========================
  // STAIRS
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Stairs',
    cameraName: 'STAIRS-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/3001',
    port: '154',
    mediaMtxPath: 'bhiwadi-154-ch3001-stairs-02',
  ),

  // ============================================================
  // PUNE R&D
  // ============================================================
  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Lift',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/101',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch101-camera-1',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Reception',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/201',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch201-camera-2',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Lobby',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/301',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch301-camera-3',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 4',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/401',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch401-camera-4',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 5',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/501',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch501-camera-5',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 6',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/601',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch601-camera-6',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 7',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/701',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch701-camera-7',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 8',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/801',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch801-camera-8',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 9',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/901',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch901-camera-9',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 10',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1001',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1001-camera-10',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 11',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1101',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1101-camera-11',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 12',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1201',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1201-camera-12',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Camera 13',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1301',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1301-camera-13',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 14',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1401',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1401-camera-14',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Canteen',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1501',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1501-camera-15',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Outer Area 1',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1601',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1601-camera-16',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Outer Area 2',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1701',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1701-camera-17',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Office',
    cameraName: 'Camera 18',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1801',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1801-camera-18',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Camera 19',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1901',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch1901-camera-19',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Camera 20',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/2001',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch2001-camera-20',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Other Area',
    cameraName: 'Camera 21',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/2101',
    port: '54',
    mediaMtxPath: 'pune-rd-54-ch2101-camera-21',
  ),

  // ============================================================
  // KRISHNAGIRI
  // ============================================================
  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera1',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=1&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-1',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera2',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=2&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-2',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera3',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=3&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-3',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera4',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=4&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-4',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera5',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=5&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-5',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera6',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=6&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-6',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera7',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=7&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-7',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera8',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=8&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-8',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Office Ground Floor',
    cameraName: 'Camera9',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=9&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-office-ground-floor-camera-9',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera10',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=10&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-10',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera11',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=11&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-11',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera12',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=12&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-12',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera13',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=13&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-13',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera14',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=14&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-14',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera15',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=15&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-15',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Office Ground Floor',
    cameraName: 'Camera16',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=16&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-office-ground-floor-camera-16',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera17',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=17&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-17',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Office Ground Floor',
    cameraName: 'Camera18',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=18&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-office-ground-floor-camera-18',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Camera19',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=19&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-outer-periphery-gates-camera-19',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Office Ground Floor',
    cameraName: 'Camera20',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=20&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-office-ground-floor-camera-20',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera21',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=21&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-21',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera22',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=22&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-22',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera23',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=23&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-23',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera24',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=24&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-24',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera25',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=25&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-25',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera26',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=26&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-26',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera27',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=27&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-27',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera28',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=28&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-28',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera29',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=29&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-29',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera30',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=30&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-30',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera31',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=31&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-31',
  ),

  CameraData(
    plant: 'Krishnagiri',
    zone: 'Other Area',
    cameraName: 'Camera32',
    rtspUrl:
        'rtsp://admin:cctv%402025%24@115.240.235.147:554/cam/realmonitor?channel=32&subtype=0',
    port: '147',
    mediaMtxPath: 'krishnagiri-other-area-camera-32',
  ),
];


 // ============================================================
  // SEC - 3 MANESAR
  // ============================================================

  // ============================================================
  // NVR - 14.140.246.43
  // ============================================================

  // =========================
  // WIP
  // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'T/H TESTING LINE',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/101',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'RR Testing Gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/201',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'RR Testing Main Gate',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/301',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'T/H TESTING AREA',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/401',
  //   port: '43',
  // ),

  // // =========================
  // // WIP - THROUGH HOLE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'Through Hole',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/501',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'wave soldering T/H',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/601',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'Wave Soldering',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/701',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'THROUGH HOLE ENTRY GATE',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/801',
  //   port: '43',
  // ),

  // // =========================
  // // WIP - SMT
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'SMT Line 1',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/901',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'SMT Line 3/4',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1001',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'SMT GALLERY 1',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1101',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'SMT GALLERY 2',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1201',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'SMT Line 1/3',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1301',
  //   port: '43',
  // ),

  // // =========================
  // // STORE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Store MWH',
  //   cameraName: 'consumable store gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1401',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Store ED',
  //   cameraName: 'ED Store 1',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1501',
  //   port: '43',
  // ),

  // // =========================
  // // CANTEEN
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Canteen',
  //   cameraName: 'MD PANTRY GALLERY',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1601',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Canteen',
  //   cameraName: 'Canteen Gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1701',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Canteen',
  //   cameraName: 'Canteen',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1801',
  //   port: '43',
  // ),

  // // =========================
  // // MAINTENANCE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'Gas Bank',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/1901',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'UPS Gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2001',
  //   port: '43',
  // ),

  // // =========================
  // // NEW / OTHER PRODUCTION
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'AWP',
  //   cameraName: 'LED Area new',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2101',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Switch Assy',
  //   cameraName: 'AC CONTROLLER LINE 2',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2201',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Switch Assy',
  //   cameraName: 'R&D SWITCH DEPT.',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2301',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'MWH Assy',
  //   cameraName: 'MOLDING AREA',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2401',
  //   port: '43',
  // ),

  // // =========================
  // // OFFICE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Office Ground Floor',
  //   cameraName: 'MD Office Gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2501',
  //   port: '43',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Office 1St Floor',
  //   cameraName: 'FF Account Gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.43:554/Streaming/Channels/2601',
  //   port: '43',
  // ),

  // // ============================================================
  // // NVR - 14.140.246.37
  // // ============================================================

  // // =========================
  // // OUTER PERIPHERY & GATES
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'MATERIAL GATE',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/101',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Store MWH',
  //   cameraName: 'gas yard locker area',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/301',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Office Ground Floor',
  //   cameraName: 'HR GALERY',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/401',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'IPCamera 05',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/501',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'TKE Lift',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/601',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'IPCamera 07',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/701',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Outer Periphery & Gates',
  //   cameraName: 'MAIN GATE',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/801',
  //   port: '37',
  // ),

  // // =========================
  // // SWITCH ASSY
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Switch Assy',
  //   cameraName: 'AC CTRL LINE 2',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1001',
  //   port: '37',
  // ),

  // // =========================
  // // STORE / DOCK
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Store MWH',
  //   cameraName: 'Shoes Rack',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1101',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Dock Area',
  //   cameraName: 'Dispatch 1 outside',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1201',
  //   port: '37',
  // ),

  // // =========================
  // // MAINTENANCE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'DG Room Back side',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1401',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'Chemical Room side',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1501',
  //   port: '37',
  // ),

  // // =========================
  // // DOCK AREA
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Dock Area',
  //   cameraName: 'Dispatch loading area',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1601',
  //   port: '37',
  // ),

  // // =========================
  // // TERRACE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Terrace',
  //   cameraName: 'Terrace Air Washer side',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1701',
  //   port: '37',
  // ),

  // // =========================
  // // CANTEEN
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Canteen',
  //   cameraName: 'pentry locker area',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1801',
  //   port: '37',
  // ),

  // // =========================
  // // MAINTENANCE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'SPD ROOM',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/1901',
  //   port: '37',
  // ),

  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'server room',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2001',
  //   port: '37',
  // ),

  // // =========================
  // // WIP / FG
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'WIP',
  //   cameraName: 'FG Area',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2101',
  //   port: '37',
  // ),

  // // =========================
  // // MAINTENANCE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'DG ROOM BACK SIDE',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2201',
  //   port: '37',
  // ),

  // // =========================
  // // STORE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Store MWH',
  //   cameraName: 'consumable store gallery',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2401',
  //   port: '37',
  // ),

  // // =========================
  // // OFFICE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Office Ground Floor',
  //   cameraName: 'Reception Corridor',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2501',
  //   port: '37',
  // ),

  // // =========================
  // // MAINTENANCE
  // // =========================
  // CameraData(
  //   plant: 'Sec 3 Manesar',
  //   zone: 'Maintenance',
  //   cameraName: 'gase bank',
  //   rtspUrl: 'rtsp://HR:Napino%407@14.140.246.37:554/Streaming/Channels/2601',
  //   port: '37',
  // ),
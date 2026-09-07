class CameraData {
  final String plant;
  final String zone;
  final String cameraName;
  final String rtspUrl;
  final String port;

  const CameraData({
    required this.plant,
    required this.zone,
    required this.cameraName,
    required this.rtspUrl,
    required this.port,
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'CAM 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=2&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'Channel29',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=29&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'AWP',
    cameraName: 'AWP-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=30&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Near REML Line',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2201',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'Locker Room 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=5&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'Locker Room 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=6&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'CAM 7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=7&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'CAM 11',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=11&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Area New',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=17&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'WIP',
    cameraName: 'WIP Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=25&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 5',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/701',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/801',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 1 Wire Assembly',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/901',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 1',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1001',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 3 BOP Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1101',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET Test',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1701',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Drinking Water Tr Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/3001',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Wire Assembly Conveyor-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=1&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv-7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=12&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=13&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Maintenance Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=14&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=16&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'ET Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=18&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Gogoro Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=19&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Offline First-Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=20&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'Offline MWH',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=23&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conv-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=26&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'REML-Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=28&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=31&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=4&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=5&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 8',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=8&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 9',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=9&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'CAM 12',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=12&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'MWH Conveyor-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=12&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'MWH Assy',
    cameraName: 'PDI Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=19&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Old Switch Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=21&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Switch Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=28&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Material Lift',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=31&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Switch Assy',
    cameraName: 'Switch Padprinting',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=32&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Testing-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2001',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Final',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2101',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED USB Quality Desk',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=30&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Testing',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=32&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Corridor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=3&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=4&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=5&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Throughhole-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=6&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'SMT-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=7&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Through-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=8&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'Edtesting-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=11&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'ED Shop Floor',
    cameraName: 'ED Operator Att M/C',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=13&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'Store',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/201',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=15&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=16&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Store MWH',
    cameraName: 'FG Packing-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=18&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock',
    cameraName: 'Material Unloading-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2301',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Dispatch Loading',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2901',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Dispatch Bin Storage',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=2&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'BOP Scrap Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=29&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock',
    cameraName: 'Out Source Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=14&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'FG Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=21&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Dock Area',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=27&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2701',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Parking North Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2801',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Entry Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=7&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DG Area 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=9&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DG Area 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=10&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Maingate Entrance North',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=25&subtype=1',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'CAM 10',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=10&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Park/Diesel Yard',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=1&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Maingate Security',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=22&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=24&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=26&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Temple Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=8&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'AWP Entrance Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=15&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'IT/HR Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=24&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Lift Panel',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=27&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'CAM 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=1&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Reception',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=2&subtype=0',
    port: '45',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office Ground Floor',
    cameraName: 'Auditorium Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=10&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'ED Office',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=4&subtype=0',
    port: '42',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'CAM 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=3&subtype=0',
    port: '44',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Office 1St Floor',
    cameraName: 'CAM 6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=6&subtype=0',
    port: '44',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Maintenance',
    cameraName: 'Transformer East Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1301',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Maintenance',
    cameraName: 'Chiller Room',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=11&subtype=0',
    port: '42',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Canteen',
    cameraName: 'Canteen Punching M/C Counter',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1401',
    port: '43',
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Canteen',
    cameraName: 'Canteen-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=9&subtype=0',
    port: '45',
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
  ),

  CameraData(
    plant: 'Haridwar',
    zone: 'Training Room',
    cameraName: 'TTC First Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=22&subtype=0',
    port: '42',
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
  ),

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

  // ============================================================
  // SEC - 8 MANESAR
  // ============================================================
  // ============================================================
  // SEC - 8 MANESAR
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Terrace',
    cameraName: 'TERRACE WATER TANK',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/201',
    port: '125',
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
  ),

  // =========================
  // RECEPTION
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'RECPTION TEMPLE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/401',
    port: '125',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'OUTSIDE PARKING',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/601',
    port: '125',
  ),

  // =========================
  // Lab
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Lab',
    cameraName: 'ENV LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/701',
    port: '125',
  ),

  // =========================
  // RECEPTION
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'RECEPTION PANTRY',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/801',
    port: '125',
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
  ),

  // =========================
  // OFFICE GROUND FLOOR
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'QUALITY OFFICE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1401',
    port: '125',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'DESIGN OFFICE 1',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/1801',
    port: '125',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'VALEO LINE 2',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2001',
    port: '125',
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'EMBEDDED LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2101',
    port: '125',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2401',
    port: '125',
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
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'CORRIDOR ELECTRONICS LAB',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2701',
    port: '125',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo FG Stroage',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/2801',
    port: '125',
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
  ),

  // ============================================================
  // CAMERA #31 REMOVED
  // ============================================================

  // =========================
  // CAMERA #32
  // MAIN GATE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'MAIN GATE',
    rtspUrl: 'rtsp://admin:hik10021@115.112.58.125:554/Streaming/Channels/3201',
    port: '125',
  ),

  // ============================================================
  // SEC - 8 MANESAR
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
  ),

  // =========================
  // STORE
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'ED TESTING AREA',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/201',
    port: '126',
  ),

  // =========================
  // MATERIAL LIFT
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'MATERIAL LIFT 1ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/301',
    port: '126',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL EFI',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/801',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL EFI',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/901',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'T/H 1ST FL WAVE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1001',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'PASSAGE T/H 1ST WATER COOLER',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1101',
    port: '126',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 3',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1401',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 4',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1501',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'SMT',
    cameraName: 'SMT LINE 1',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1601',
    port: '126',
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'CLUSTER AREA 1 ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1701',
    port: '126',
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
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'CLUSTER AREA 1 ST FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/1901',
    port: '126',
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'NEW LAB PASSAGE 2ND FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2001',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'DISPETCH SIDE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2101',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Office',
    cameraName: 'TRANSMISSION LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2201',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'PASSAGE 2ND FL LAB',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2301',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'EMC LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2401',
    port: '126',
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'HONDA LINE 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2501',
    port: '126',
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
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: '2ND FLOOR VALEO LINE',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2701',
    port: '126',
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
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'RIG LAB 2ND FLOOR',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/2901',
    port: '126',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'PASSAGE AREA 2ND FL',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/3001',
    port: '126',
  ),

  // =========================
  // Shop Floor
  // =========================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'MOLDING AREA',
    rtspUrl:
        'rtsp://admin:admin10021@115.112.58.126:554/Streaming/Channels/3101',
    port: '126',
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
  ),

  // =========================
  // 115.112.58.127
  // =========================

  // ============================================================
  // SEC - 8 MANESAR
  // 115.112.58.127
  // TOTAL CAMERAS: 28
  // ============================================================
  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 1',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/101',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 2',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/201',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 3',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/301',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger & BCM Line',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/401',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 5',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/501',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 6',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/601',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 7',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/701',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/801',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/901',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1001',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Valeo J4U',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1101',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 12',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1201',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 13',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1301',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Dock Area',
    cameraName: 'Camera 14',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1401',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 15',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1501',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 16',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1601',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Store',
    cameraName: 'Camera 17',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1701',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 18',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1801',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Through Hole',
    cameraName: 'TH 19',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/1901',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 20',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2001',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 21',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2101',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 22',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2201',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 23',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2301',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Scrape Area',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2401',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 25',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2501',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 26',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2601',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Battery Charger',
    cameraName: 'Battery Charger 27',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2701',
    port: '127',
  ),

  CameraData(
    plant: 'Sec 8 Manesar',
    zone: 'Shop Floor',
    cameraName: 'Camera 28',
    rtspUrl:
        'rtsp://admin:Napino%40282@115.112.58.127:554/Streaming/Channels/2801',
    port: '127',
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
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'SWITCH LINE',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/201',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch Domino Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/301',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch AAFF Line',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/401',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch Ather Line',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/501',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Switch',
    cameraName: 'Switch WIP Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/601',
    port: '154',
  ),

  // =========================
  // OFFICE / FLOOR
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Office 1St Floor',
    cameraName: '1st Floor-01',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/701',
    port: '154',
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
  ),

  // =========================
  // MATERIAL GATE
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Material Gate',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/901',
    port: '154',
  ),

  // =========================
  // FG AREA
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'FG Area',
    cameraName: 'FG Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1001',
    port: '154',
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
  ),

  // =========================
  // PARKING
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Parking',
    cameraName: '4-Wheeler',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1201',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Parking',
    cameraName: '4-WHEELER',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1301',
    port: '154',
  ),

  // =========================
  // OFFICE 1ST FLOOR
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Office 1St Floor',
    cameraName: '1st floor-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1401',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Office 1St Floor',
    cameraName: '1st floor-03',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1501',
    port: '154',
  ),

  // =========================
  // DISPATCH
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Dispatch',
    cameraName: 'Despatch Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1601',
    port: '154',
  ),

  // =========================
  // OFFICE 1ST FLOOR
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Office 1St Floor',
    cameraName: '1st floor-04',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1701',
    port: '154',
  ),

  // =========================
  // GALLERY
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Gallery',
    cameraName: 'Back Side Gallery',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/1801',
    port: '154',
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
  ),

  // =========================
  // WIP
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'WIP',
    cameraName: 'WIP MC Ground',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2001',
    port: '154',
  ),

  // =========================
  // SCRAP YARD
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Scrap Yard',
    cameraName: 'Scrap Yard',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2101',
    port: '154',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Main Gate Enterance',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2201',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'FRONT GATE',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2301',
    port: '154',
  ),

  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Front Area',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2401',
    port: '154',
  ),

  // =========================
  // MAINTENANCE
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Maintenance',
    cameraName: 'COMPRESSOR AREA',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2501',
    port: '154',
  ),

  // =========================
  // OUTER PERIPHERY & GATES
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Outer Periphery & Gates',
    cameraName: 'Gate No-02',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2601',
    port: '154',
  ),

  // =========================
  // STAIRS
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Stairs',
    cameraName: 'STAIRS 1ST FLOOR',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2701',
    port: '154',
  ),

  // =========================
  // TERRACE
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Terrace',
    cameraName: 'TERRACE',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/2801',
    port: '154',
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
  ),

  // =========================
  // DISPATCH
  // =========================
  CameraData(
    plant: 'Bhiwadi',
    zone: 'Dispatch',
    cameraName: 'GF DESPATCH',
    rtspUrl:
        'rtsp://admin:Internet%40123@61.1.105.154:554/Streaming/Channels/3101',
    port: '154',
  ),

  // ============================================================
  // PUNE R&D
  // ============================================================
  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 1',
    cameraName: 'Camera 1',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/101',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 1',
    cameraName: 'Camera 2',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/201',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 1',
    cameraName: 'Camera 3',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/301',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 1',
    cameraName: 'Camera 4',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/401',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 1',
    cameraName: 'Camera 5',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/501',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 2',
    cameraName: 'Camera 6',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/601',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 2',
    cameraName: 'Camera 7',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/701',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 2',
    cameraName: 'Camera 8',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/801',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 2',
    cameraName: 'Camera 9',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/901',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 2',
    cameraName: 'Camera 10',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1001',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 3',
    cameraName: 'Camera 11',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1101',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 3',
    cameraName: 'Camera 12',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1201',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 3',
    cameraName: 'Camera 13',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1301',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 3',
    cameraName: 'Camera 14',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1401',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 3',
    cameraName: 'Camera 15',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1501',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 16',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1601',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 17',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1701',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 18',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1801',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 19',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/1901',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 20',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/2001',
    port: '54',
  ),

  CameraData(
    plant: 'Pune R&D',
    zone: 'Zone 4',
    cameraName: 'Camera 21',
    rtspUrl:
        'rtsp://admin:Vvipl%40321@103.212.155.54:554/Streaming/Channels/2101',
    port: '54',
  ),
];

class Device {
  final String location;
  final String model;
  final String url;

  Device({required this.location, required this.model, required this.url});
}

final List<Device> devices = [
  Device(
    location: "Pune",
    model: "iDS-7108HQHI-M1 / S",
    // url: "http://172.16.81.41",
    url: "http://14.140.246.37/doc/page/login.asp?_1784876199369",
  ),

  Device(
    location: "Bhiwadi",
    model: "DS-7732NI-K4",
    url: "http://172.16.41.246",
  ),

  Device(
    location: "Sector-7",
    model: "DS-7732NI-K4",
    url: "http://192.168.2.168",
  ),

  Device(
    location: "Sector-8",
    model: "DS-7732NI-K4",
    url: "http://172.16.33.111",
  ),

  Device(
    location: "Sector-8",
    model: "DS-7P32NI-K4",
    url: "http://172.16.33.112:81",
  ),

  Device(
    location: "Sector-8",
    model: "DS-7732NI-K4",
    url: "http://172.16.33.114",
  ),

  Device(
    location: "Sector-8",
    model: "DS-7216HGHI-F1",
    url: "http://172.16.33.113:82",
  ),

  Device(
    location: "Sector-3",
    model: "DS-7732NI-K4",
    url: "http://172.16.16.12",
  ),

  Device(
    location: "Sector-3",
    model: "DS-7732NI-K4",
    url: "http://172.16.16.22",
  ),

  Device(
    location: "Sector-3",
    model: "DS-7732NI-K4",
    url: "http://172.16.16.32",
  ),

  Device(
    location: "Haridwar",
    model: "DS-7632NXI-K2",
    url: "http://172.16.30.19",
  ),

  Device(
    location: "Haridwar",
    model: "CP-UNR-4K4322-V3",
    url: "http://172.16.30.17",
  ),

  Device(
    location: "Haridwar",
    model: "CP-UNR-4K4322-V2",
    url: "http://172.16.30.121",
  ),

  Device(
    location: "Haridwar",
    model: "CP-UVR-1601E1-IC",
    url: "http://172.16.30.20",
  ),
];

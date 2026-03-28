{
  networking.networkmanager = {
    enable = true;
    wifi.backend = "wpa_supplicant";
    wifi.scanRandMacAddress = true;
    wifi.macAddress = "random";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}

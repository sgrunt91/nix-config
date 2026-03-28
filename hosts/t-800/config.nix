{
  username,
  ...
}:
{
  modules = {
    services.hypridle.desktop = true;
    powerManagement.hdparm.enable = true;
  };

  # CpuFreqGov performance mode
  powerManagement.cpuFreqGovernor = "performance";

  home-manager.users.${username} =
    { pkgs, ... }:
    {
        spawn-sh-at-startup = [
          [ "sleep 1 && goose-shell ipc call networking setWifiEnabled false" ]
        ];
      };
}

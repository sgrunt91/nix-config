{
  pkgs,
  inputs,
  system,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    btop
    git
    wget
    firefox
  ];
}

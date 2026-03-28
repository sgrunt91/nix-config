{ lib, username, ... }:

{
  # Console (TTY)
  console.keyMap = lib.mkForce "fr";

  # X11 layout
  services.xserver.xkb = lib.mkForce {
    layout = "fr";
    variant = "azerty";
  };

  # Home Manager / Wayland (Niri) layout
  home-manager.users.${username} =
    { lib, config, ... }:
    {
      wayland.windowManager.niri.settings.input.keyboard.xkb.layout = lib.mkForce "fr";
      wayland.windowManager.niri.settings.input.keyboard.xkb.variant = lib.mkForce "azerty";
    };
}


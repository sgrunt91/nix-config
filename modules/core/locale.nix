{
  # Timezone & location
  time.timeZone = "Europe/Paris";
  location.provider = "geoclue2";

  # Locales
  i18n = {
    defaultLocale = "fr_FR.UTF-8";           # main system locale
    supportedLocales = [ "fr_FR.UTF-8" "en_US.UTF-8" ];  # generated locales

    # Optional: fine-grained LC_* overrides
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  # Console (TTY) keyboard layout
  console.keyMap = "fr";

  # X11 keyboard layout
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty"; 
  };
}


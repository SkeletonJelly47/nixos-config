{
  den.default.nixos = {
    # Set your time zone.
    time.timeZone = "Europe/Helsinki";

    # https://www.man7.org/linux/man-pages/man7/locale.7.html
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_CTYPE = "fi_FI.UTF-8";
      LC_ADDRESS = "fi_FI.UTF-8";
      LC_IDENTIFICATION = "fi_FI.UTF-8";
      LC_MEASUREMENT = "fi_FI.UTF-8";
      LC_MONETARY = "fi_FI.UTF-8";
      LC_NAME = "fi_FI.UTF-8";
      LC_NUMERIC = "fi_FI.UTF-8";
      LC_PAPER = "fi_FI.UTF-8";
      LC_TELEPHONE = "fi_FI.UTF-8";
      LC_TIME = "fi_FI.UTF-8";
      LC_COLLATE = "fi_FI.UTF-8";
    };
  };
}

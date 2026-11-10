{
  den.aspects.plasma = {host, ...}: {
    nixos = {
      services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}

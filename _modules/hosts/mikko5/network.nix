#{ self, inputs, ...}:
{
  flake.nixosModules.mikkone5 = {
    networking.hostName = "nixos"; # Define your hostname.

    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    networking.firewall = {
      enable = true;

      # Open ports in the firewall.
      # allowedTCPPorts = [ ... ];
      allowedUDPPortRanges = [
        {
          # BG3 Ports for direct connect
          from = 23243;
          to = 23262;
        }
      ];
    };
  };
}
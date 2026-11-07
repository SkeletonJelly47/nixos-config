{
  den.aspects.bg3.nixos = {
    # BG3 direct connect port range
    networking.firewall = {
      allowedUDPPortRanges = [
        {
          from = 23243;
          to = 23262;
        }
      ];
    };
  };
}

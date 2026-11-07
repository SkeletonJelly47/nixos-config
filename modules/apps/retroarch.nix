{
  den.aspects.retroarch.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      retroarch-assets
      (retroarch.withCores (cores:
        with cores; [
          dolphin
          snes9x
        ]))
    ];
  };
}

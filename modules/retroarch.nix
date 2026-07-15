{
  flake.nixosModules.retroarch = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      retroarch-assets
      (retroarch.withCores (cores:
        with cores; [
          dolphin
        ]))
    ];
  };
}

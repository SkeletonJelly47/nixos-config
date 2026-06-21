{
  flake.nixosModules.music = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      tidal-hifi
      fooyin
    ];
  };
}
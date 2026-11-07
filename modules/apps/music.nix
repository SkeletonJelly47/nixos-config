{
  den.aspects.music.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      unstable.tidal-hifi
      tidal-dl
      unstable.fooyin
    ];
  };
}

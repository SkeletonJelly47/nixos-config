{
  den.aspects.music = {
    streaming.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        unstable.tidal-hifi
      ];
    };

    local.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        tidal-dl
        unstable.fooyin
        amarok
      ];
    };
  };
}

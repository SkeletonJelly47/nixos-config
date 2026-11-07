{
  den.aspects.videoedit.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      losslesscut-bin
      shotcut
    ];
  };
}

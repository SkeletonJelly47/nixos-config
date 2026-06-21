{
  flake.nixosModules.videoedit = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      losslesscut-bin
      shotcut
    ];
  };
}
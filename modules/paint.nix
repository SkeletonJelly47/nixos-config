{
  flake.nixosModules.paint = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gimp
      pinta
      krita
    ];
  };
}
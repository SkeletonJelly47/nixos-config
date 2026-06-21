{
  flake.nixosModules.podcast = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kdePackages.kasts
    ];
  };
}
{
  flake.nixosModules.tex = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      texliveFull
      texstudio
    ];
  };
}
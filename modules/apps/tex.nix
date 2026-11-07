{
  den.aspects.tex.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      texliveFull
      texstudio
    ];
  };
}

{
  den.aspects.podcast = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      kdePackages.kasts
    ];
  };
}

{
  den.aspects.audacity.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [audacity];
  };
}

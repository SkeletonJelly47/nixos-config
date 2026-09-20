{
  flake.nixosModules.audacity = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [audacity];
  };
}

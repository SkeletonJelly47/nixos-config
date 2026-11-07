{
  den.aspects.obsidian.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [obsidian];
  };
}

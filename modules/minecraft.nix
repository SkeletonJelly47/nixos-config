{ self, inputs, ... }:
{
  flake.nixosModules.minecraft = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pkgs.prismlauncher
    ];
  };
}
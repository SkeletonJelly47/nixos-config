{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    environment.systemPackages = [
      # TODO: use ${system} instead of hard coded system string
      inputs.nixvim-config.packages."x86_64-linux".default
    ];
  };
}
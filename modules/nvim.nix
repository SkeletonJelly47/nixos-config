{ self, inputs, ... }:
{
  flake.nixosModules.nvim = {
    environment.systemPackages = [
      # TODO: use ${system} instead of hard coded system string
      inputs.nvim-flake.packages."x86_64-linux".default
    ];
  };
}

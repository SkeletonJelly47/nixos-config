{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    programs.nixvim.opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 4;
    };
  };
}
{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    imports = [ inputs.nixvim.nixosModules.nixvim ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      colorschemes.gruvbox.enable = true;
    };
  };
}
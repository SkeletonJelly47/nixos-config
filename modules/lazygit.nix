{ self, inputs, ... }:
{
  flake.nixosModules.lazygit = {
    programs.lazygit = {
      enable = true;
    };

    environment.shellAliases = {
      lg = "lazygit";
    };
  };
}

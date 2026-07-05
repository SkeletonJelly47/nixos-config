{ self, inputs, ... }:
{
  flake.nixosModules.lazygit = {
    programs.lazygit = {
      enable = true;

      settings = {
        keybinding = {
          universal = {
            quit = "Q";
          };
        };
      # TODO: os: shellFunctionsFile: from where?
      # https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md#using-aliases-or-functions-in-shell-commands
      };
    };

    environment.shellAliases = {
      lg = "lazygit";
    };
  };
}

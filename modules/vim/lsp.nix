{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    programs.nixvim.plugins = {
      lsp-format.enable = true;
      lsp-lines.enable = true;

      lsp = {
        enable = true;

        servers = {
          zls = {
            enable = true;
          };
        };
      };
    };
  };
}
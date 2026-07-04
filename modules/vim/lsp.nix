{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    programs.nixvim.plugins = {
      lsp-format.enable = true;
      lsp-lines.enable = true;

      lsp = {
        enable = true;

        servers = {
          nixd = {
            enable = true;
          };

          zls = {
            enable = true;
          };
        };
      };

      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
  };
}
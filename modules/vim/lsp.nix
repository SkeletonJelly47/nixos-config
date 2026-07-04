{ self, inputs, ... }:
{
  flake.nixosModules.nixvim = {
    programs.nixvim.lsp = {
      inlayHints.enable = true;

      servers = {
        nixd = {
          enable = true;
          config = {
            nixpkgs.expr = "import <nixpkgs> {}";
            formatting.command = [ "alejandra" ];
            options =
              let
                flake = ''(builtins.getFlake "/home/mikko5/nixos-config")'';
              in
              {
                nixos.expr = "${flake}.nixosConfigurations.mikko5.options";
              };
          };
        };

        zls = {
            enable = true;
        };
      };
    };

    programs.nixvim.plugins = {
      lspconfig.enable = true;
      lsp-format.enable = true;
      lsp-lines.enable = true;

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
{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    awww.url = "git+https://codeberg.org/LGFae/awww";
    mangobar.url = "github:mangowm/mangobar";
  };

  den.aspects.mango = {host, ...}: {
    nixos = {pkgs, ...}: {
      imports = [inputs.mangowm.nixosModules.mango];
      programs.mango.enable = true;

      # services = {
      #   getty.autologinUser = "tux";
      # };

      # programs.fish.loginShellInit = ''
      #   if test (tty) = /dev/tty1
      #     exec mango
      #   end
      # '';

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_RENDERER_ALLOW_SOFTWARE = "1";
      };

      environment.systemPackages = [
        pkgs.rofi
        inputs.awww.packages.${host.system}.awww
        inputs.mangobar.packages.${host.system}.default
        pkgs.swaynotificationcenter
      ];

      xdg.portal = {
        enable = true;
        wlr.enable = true;
      };
    };

    provides.to-users.hjem = {
      files.".config/mango".source = ./mango;
      files.".config/mangobar".source = ./mangobar;
    };
  };

  den.schema.host.includes = [den.aspects.mango den.aspects.fonts];
}

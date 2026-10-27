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
  };

  den.aspects.mango = {
    nixos = {
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
    };

    provides.to-users.hjem = {
      files.".config/mango/config.conf".text = ''
        bind=SUPER,m,quit
      '';
    };
  };

  den.schema.host.includes = [den.aspects.mango];
}

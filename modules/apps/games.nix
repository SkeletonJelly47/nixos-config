{
  den.aspects.games = {
    steam = {
      nixos = {
        programs = {
          gamemode.enable = true;

          steam = {
            enable = true;
            gamescopeSession.enable = true;
          };
        };
      };

      provides.to-users.user.extraGroups = ["gamemode"];
    };

    non-steam = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          wineWow64Packages.staging
          winetricks

          lutris
          heroic
          bottles

          itch
        ];
      };
    };
  };
}

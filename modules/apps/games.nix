{
  den.aspects.games = {
    nixos = {pkgs, ...}: {
      programs = {
        gamemode.enable = true;

        steam = {
          enable = true;
          gamescopeSession.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        wineWow64Packages.staging
        winetricks

        lutris
        heroic
        bottles

        itch
      ];
    };

    provides.to-users.user.extraGroups = ["gamemode"];
  };
}

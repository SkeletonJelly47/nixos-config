{
  flake.nixosModules.user = {
    users.users.mikko5 = {
      isNormalUser = true;
      description = "mikko5";
      extraGroups = [
        "networkmanager"
        "wheel"
        "gamemode"
        "docker"
      ];
    };
  };
}
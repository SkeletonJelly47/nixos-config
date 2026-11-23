{den, ...}: {
  den.aspects.docker = {
    nixos = {
      virtualisation.docker.enable = true;
    };

    # todo: consider rootless mode
    provides.to-users.user.extraGroups = ["docker"];
  };
}

{den, ...}: {
  den.aspects.direnv.nixos = {
    programs.direnv.enable = true;
  };

  den.schema.host.includes = [den.aspects.direnv];
}

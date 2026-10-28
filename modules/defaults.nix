{
  lib,
  den,
  ...
}: {
  den.default.nixos.system.stateVersion = "26.05";
  den.default.includes = [den.batteries.hostname];
  den.schema.user.classes = lib.mkDefault ["hjem"];
}

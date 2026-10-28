{
  lib,
  den,
  ...
}: {
  den.default.nixos.system.stateVersion = "26.05";

  den.schema.user.classes = lib.mkDefault ["hjem"];
}

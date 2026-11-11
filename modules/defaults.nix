{
  lib,
  den,
  inputs,
  ...
}: {
  den.default.nixos.system = {
    stateVersion = "26.05";
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  };

  den.default.includes = [den.batteries.hostname];
  den.schema.user.classes = lib.mkDefault ["hjem"];
}

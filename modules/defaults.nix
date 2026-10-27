{
  lib,
  den,
  ...
}: {
  den.default.nixos.system.stateVersion = "26.05";

  # enable hjem by default
  den.schema.user.classes = lib.mkDefault ["hjem"];

  # User TODO: REMOVE THIS
  den.aspects.tux.nixos = {
    boot.loader.grub.enable = false;
    fileSystems."/".device = "/dev/fake";
    fileSystems."/".fsType = "auto";
  };
}

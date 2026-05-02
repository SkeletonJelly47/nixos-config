{ self, inputs, ... }:
{
  flake.nixosModules.tablet = {
    # https://wiki.nixos.org/wiki/OpenTabletDriver
    hardware.opentabletdriver.enable = true;
    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
  };
}
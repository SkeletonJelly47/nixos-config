{
  den.aspects.opentabletdriver.nixos = {
    hardware.opentabletdriver.enable = true;

    hardware.uinput.enable = true;
    boot.kernelModules = ["uinput"];
  };
}

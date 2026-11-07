{
  den.aspects.paint.nixos = {pkgs, ...}: {
    hardware.opentabletdriver.enable = true;

    hardware.uinput.enable = true;
    boot.kernelModules = ["uinput"];

    environment.systemPackages = with pkgs; [
      gimp
      pinta
      krita
      drawpile
    ];
  };
}

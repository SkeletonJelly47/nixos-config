{
  den.aspects._3dprinting.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      freecad
      orca-slicer
    ];
  };
}

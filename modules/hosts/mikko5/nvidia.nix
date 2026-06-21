{
  flake.nixosModules.mikkone5 = { config, ...}: {
    boot = {
      kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
      # TODO: move to obs module
      kernelModules = [ "v4l2loopback"];
    };

    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        open = false;
        videoAcceleration = true;
        nvidiaSettings = true;
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      };
    };
  };
}
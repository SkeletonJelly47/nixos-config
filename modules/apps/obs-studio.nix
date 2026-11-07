{den, ...}: {
  den.aspects.obs-studio.nixos = {pkgs, ...}: {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;

      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
    };
  };
}

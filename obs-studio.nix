{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.unstable.obs-studio-plugins; [
      input-overlay
    ];
  };
}

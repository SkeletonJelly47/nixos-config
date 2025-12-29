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
      # Revert when this is merged https://github.com/NixOS/nixpkgs/pull/469141
      droidcam-obs

      # (droidcam-obs.overrideAttrs (_finalAttrs: {
      #   # ignore finalAttrs to avoid having to remove ffmpeg 7
      #   buildInputs = with pkgs; [ libjpeg libimobiledevice libusbmuxd libplist obs-studio ffmpeg ];

      #   patches = [
      #     (pkgs.fetchpatch { url = "https://github.com/dev47apps/droidcam-obs-plugin/commit/73ec2a01e234e6b2287866c25b4242dca6d9d2f6.patch"; hash = "sha256-AI2Z9i3+KfvmpyVX9WwX3jcA1hyUZiFO7kWRsb+8/10="; })
      #   ];

      #   makeFlags = [
      #     "ALLOW_STATIC=no"
      #     "JPEG_DIR=${lib.getDev pkgs.libjpeg}"
      #     "JPEG_LIB=${lib.getLib pkgs.libjpeg}/lib"
      #     "IMOBILEDEV_DIR=${lib.getDev pkgs.libimobiledevice}"
      #     "IMOBILEDEV_DIR=${lib.getLib pkgs.libimobiledevice}"
      #     "LIBOBS_INCLUDES=${pkgs.obs-studio}/include/obs"
      #     "FFMPEG_INCLUDES=${lib.getLib pkgs.ffmpeg}"
      #     "LIBUSBMUXD=libusbmuxd-2.0"
      #     "LIBIMOBILEDEV=libimobiledevice-1.0"
      #   ];
      # }))
    ];
  };
}

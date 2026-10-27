{
  flake.nixosModules._3dprinting = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      freecad # env QT_QPA_PLATFORM=xcb (no longer needed, was a problem on 1.0.2)

      # env __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink WEBKIT_DISABLE_DMABUF_RENDERER=1
      # https://github.com/NixOS/nixpkgs/issues/345590#issuecomment-3904433594
      orca-slicer
      # (pkgs.orca-slicer.overrideAttrs (prev: {
      # preFixup = (prev.preFixup or "") + ''
      #   gappsWrapperArgs+=(
      #     --set __GLX_VENDOR_LIBRARY_NAME mesa
      #     --set __EGL_VENDOR_LIBRARY_FILENAMES /run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
      #     --set MESA_LOADER_DRIVER_OVERRIDE zink
      #     --set GALLIUM_DRIVER zink
      #     --set WEBKIT_DISABLE_DMABUF_RENDERER 1
      #   )
      # '';
      # }))
    ];
  };
}
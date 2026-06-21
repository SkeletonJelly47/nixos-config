{
  flake.nixosModules.archipelago = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      archipelago
      poptracker
      r2modman
      owmods-gui # Launch with WEBKIT_DISABLE_COMPOSITING_MODE=1 https://github.com/ow-mods/ow-mod-man/issues/899#issuecomment-2608313165
    ];
  };
}
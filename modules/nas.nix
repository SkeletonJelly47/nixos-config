{
  den,
  inputs,
  ...
}: {
  den.aspects.nas.nixos = {pkgs, ...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" "mikko-nas"];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024;
      }
    ];

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
    };

    programs = {
      nix-ld = {
        enable = true;
      };

      # appimage = {
      #   enable = true;
      #   binfmt = true;
      # };
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      git
      git-lfs
      wget
      curl
      ripgrep
      fd
      btop
      gparted

      nix-inspect
      nixd
      alejandra
      nvd
      cachix
      devenv

      ungoogled-chromium
    ];

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}

{den, inputs, ...}: {
  den.aspects.kone.nixos = {pkgs, ...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" "mikko5"];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024;
      }
    ];

    # Enable CUPS to print documents.
    services.printing.enable = true;

    boot = {
      kernelPackages = pkgs.linuxPackages_6_18;
    };

    programs = {
      nix-ld = {
        enable = true;
        # libraries = with pkgs [ ];
      };

      # appimage = {
      #   enable = true;
      #   binfmt = true;
      # };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      git
      git-lfs
      wget
      curl
      rustup
      gcc
      ripgrep
      fd
      btop
      gparted

      ntfs3g

      nix-inspect
      nixd
      alejandra
      nvd
      cachix

      ungoogled-chromium
      firefox

      ffmpeg
      vlc

      discord

      yt-dlp
      kdePackages.kcalc
      kdePackages.kclock

      devenv

      linuxKernel.packages.linux_xanmod.cpupower
    ];

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}

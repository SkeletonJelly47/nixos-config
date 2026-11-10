{den, inputs, ...}: {
  den.aspects.laptop.nixos = {pkgs, ...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" "mikko5"];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    networking.networkmanager.enable = true;

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
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
      ripgrep
      fd
      btop
      gparted

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
    ];

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}

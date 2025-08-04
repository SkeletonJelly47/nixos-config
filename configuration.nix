# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./yeetmouse.nix
    ./obs-studio.nix
    ./retroarch.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  services = {
    # Enable the KDE Plasma Desktop Environment.
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fi";

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "575.64.05";
        sha256_64bit = "sha256-hfK1D5EiYcGRegss9+H5dDr/0Aj9wPIJ9NVWP3dNUC0=";
        sha256_aarch64 = "sha256-GRE9VEEosbY7TL4HPFoyo0Ac5jgBHsZg9sBKJ4BLhsA=";
        openSha256 = "sha256-mcbMVEyRxNyRrohgwWNylu45vIqF+flKHnmt47R//KU=";
        settingsSha256 = "sha256-o2zUnYFUQjHOcCrB0w/4L6xI1hVUXLAWgG2Y26BowBE=";
        persistencedSha256 = "sha256-2g5z7Pu8u2EiAh5givP5Q1Y4zk4Cbb06W37rf768NFU=";
      };
    };

    bluetooth.enable = true;
  };

  services.blueman.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mikko5 = {
    isNormalUser = true;
    description = "mikko5";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    packages = with pkgs; [
      discord
      obsidian
      spotify
    ];
  };

  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
    };

    nix-ld = {
      enable = true;
      # libraries = with pkgs [ ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Nixos 22.05 can turn on native wayland support in all chrome and most electron apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    git-lfs
    vim
    wget
    curl
    rustup
    gcc
    ripgrep
    btop
    gparted

    ntfs3g

    nixd

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
      ];
    })

    texliveFull
    texstudio

    ungoogled-chromium
    firefox

    carla
    lsp-plugins

    wineWowPackages.stable
    winetricks

    lutris

    musikcube

    ffmpeg
    vlc

    gimp3
  ];

  # LSP-Plugins workaround(?) https://discourse.nixos.org/t/lmms-vst-plugins/42985/3
  environment.variables =
    let
      makePluginPath = format:
        (lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in
    {
      DSSI_PATH = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH = makePluginPath "lv2";
      LXVST_PATH = makePluginPath "lxvst";
      VST_PATH = makePluginPath "vst";
      VST3_PATH = makePluginPath "vst3";
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

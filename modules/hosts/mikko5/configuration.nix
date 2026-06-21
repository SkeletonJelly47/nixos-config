{ self, inputs, ...}: {
  flake.nixosModules.mikkone5 = { pkgs, lib, ...}: {

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = [ "root" "mikko5" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024;
      }
    ];

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

    boot = {
      kernelPackages = pkgs.linuxPackages_6_18;
    };

    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
    ];

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Docker for Heaper
    virtualisation.docker.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mikko5 = {
      isNormalUser = true;
      description = "mikko5";
      extraGroups = ["networkmanager" "wheel" "gamemode" "docker"];
    };

    programs = {
      gamemode.enable = true;

      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };

      nix-ld = {
        enable = true;
        # libraries = with pkgs [ ];
      };

      neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      appimage = {
        enable = true;
        binfmt = true;
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

      nix-inspect
      nixd
      alejandra
      nvd

      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          jnoortheen.nix-ide
        ];
      })

      ungoogled-chromium
      firefox

      carla
      lsp-plugins

      wineWow64Packages.staging
      winetricks

      lutris
      heroic
      bottles

      ffmpeg
      vlc

      # projectplus

      discord
      #unstable.obsidian

      tidal-hifi
      musikcube
      fooyin
      kdePackages.kasts

      losslesscut-bin
      shotcut

      gimp
      pinta
      krita

      texliveFull
      texstudio

      yt-dlp
      kdePackages.kcalc
      kdePackages.kclock

      freecad # env QT_QPA_PLATFORM=xcb (no longer needed, was a problem on 1.0.2)

      #unstable.archipelago
      poptracker
      r2modman
      owmods-gui # Launch with WEBKIT_DISABLE_COMPOSITING_MODE=1 https://github.com/ow-mods/ow-mod-man/issues/899#issuecomment-2608313165

      itch

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

      jetbrains.rust-rover
      devenv

      linuxKernel.packages.linux_xanmod.cpupower
    ];

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    # LSP-Plugins workaround(?) https://discourse.nixos.org/t/lmms-vst-plugins/42985/3
    environment.variables = let
      makePluginPath = format:
        (lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in {
      DSSI_PATH = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH = makePluginPath "lv2";
      LXVST_PATH = makePluginPath "lxvst";
      VST_PATH = makePluginPath "vst";
      VST3_PATH = makePluginPath "vst3";
    };

    services.input-remapper = {
      enable = true;
      enableUdevRules = true;
    };

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "25.05"; # Did you read the comment?
  };
}
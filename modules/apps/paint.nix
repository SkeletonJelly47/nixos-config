{den, ...}: {
  den.aspects.paint = {
    krita = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          krita
        ];
      };
      includes = [den.aspects.opentabletdriver];

      # todo: figure out how to copy folder and its contents recursively
      # provides.to-users.hjem.files.".local/share/krita" = {
      #   source = ../krita;
      #   type = "copy";
      # };
      # what's the difference with .config/kritashortcutsrc and .local/share/krita/shortcuts ?
    };

    drawpile = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          drawpile
        ];
      };
      includes = [den.aspects.opentabletdriver];
    };

    pinta.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        pinta
      ];
    };
  };
}

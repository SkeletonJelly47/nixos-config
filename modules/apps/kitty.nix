{den, ...}: {
  den.aspects.kitty = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kitty
      ];
    };

    hjem.files.".config/kitty/kitty.conf".text = ''
      font_size 20
    '';
  };
}

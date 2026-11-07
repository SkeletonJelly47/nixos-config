{den, ...}: {
  den.aspects.kitty = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kitty
      ];
    };

    provides.to-users.hjem.files.".config/kitty/kitty.conf".text = ''
      font_size 20
    '';
  };
}

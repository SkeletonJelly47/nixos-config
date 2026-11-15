{den, ...}: {
  den.aspects.paint = {
    krita = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          krita
        ];
      };
      includes = [den.aspects.opentabletdriver];
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

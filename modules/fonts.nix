{den, ...}: {
  den.aspects.fonts.nixos = {pkgs, ...}: {
    fonts.packages = with pkgs;
      [
        noto-fonts-cjk-sans
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}

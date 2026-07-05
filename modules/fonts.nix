{ self, inputs, ...}:
{
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
      nerd-fonts.ubuntu-mono
    ];
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      mikkone5
      user
      locale
      yeetmouse
      fail2ban

      plasma6
      bluetooth
      audio

      games
      retroarch
      obs-studio
      archipelago
      music
      podcast

      tex
      paint
      videoedit
      _3dprinting
      audacity

      shellAlias
      nvim
      lazygit
      fonts
    ];
  };
}
